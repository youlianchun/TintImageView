//
//  TintImageView.m
//  Test
//
//  Created by YLCHUN on 2017/11/9.
//  Copyright © 2017年 YLCHUN. All rights reserved.
//

#import "TintImageView.h"


@implementation TintImageView

bool hasColor(UIColor *color)
{
    static UIColor *kClearColor;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kClearColor = [UIColor clearColor];
    });
    if (color == nil || CGColorEqualToColor(color.CGColor, kClearColor.CGColor)) {
        return NO;
    }
    return YES;
}

UIImage *templateImage(UIImage *image) {
    if (image.renderingMode == UIImageRenderingModeAlwaysTemplate) {
        return image;
    }
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

UIImage *originalImage(UIImage *image) {
    if (image.renderingMode == UIImageRenderingModeAlwaysOriginal) {
        return image;
    }
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

-(void)setImage:(UIImage *)image
{
    if (hasColor(_tintNormal)) {
        [super setImage:templateImage(image)];
    }else {
        [super setImage:originalImage(image)];
    }
    if (!super.highlighted) {
        [super setTintColor:_tintNormal];
    }
}

-(void)setHighlightedImage:(UIImage *)image
{
    if (hasColor(_tintHighlighted)) {
        [super setHighlightedImage:templateImage(image)];
    }else {
        [super setHighlightedImage:originalImage(image)];
    }
    if (super.highlighted) {
        [super setTintColor:_tintHighlighted];
    }
}

-(void)setTintNormal:(UIColor *)tintColor
{
    if (_tintNormal == tintColor) {
        return;
    }
    _tintNormal = tintColor;
    if (hasColor(_tintNormal)) {
        [super setImage:templateImage(super.image)];
    }else {
        [super setImage:originalImage(super.image)];
    }
    if (!super.highlighted) {
        [super setTintColor:_tintNormal];
    }
}

-(void)setTintHighlighted:(UIColor *)tintColor
{
    if (_tintHighlighted == tintColor) {
        return;
    }
    _tintHighlighted = tintColor;
    if (hasColor(_tintHighlighted)) {
        [super setHighlightedImage:templateImage(super.highlightedImage)];
    }else {
        [super setHighlightedImage:originalImage(super.highlightedImage)];
    }
    if (super.highlighted) {
        [super setTintColor:_tintHighlighted];
    }
}

-(void)setHighlighted:(BOOL)highlighted
{
    if (super.highlighted == highlighted) {
        return;
    }
    [super setHighlighted:highlighted];
    if (highlighted) {
        [super setTintColor:_tintHighlighted];
    }else{
        [super setTintColor:_tintNormal];
    }
}

-(BOOL)isHighlighted
{
    return [super isHighlighted];
}

@end
