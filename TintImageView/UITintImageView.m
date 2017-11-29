//
//  UITintImageView.m
//  TintImageView
//
//  Created by YLCHUN on 2017/11/20.
//  Copyright © 2017年 YLCHUN. All rights reserved.
//

#import "UITintImageView.h"

@implementation UITintImageView

-(void)layoutIfNeeded {
    [super layoutIfNeeded];
    [self updateDraw];
}

-(void)updateDraw {
    self.layer.contentsGravity = get_contents_gravity(self.contentMode);
}

-(void)setImage:(UIImage *)image {
    if (_image == image) {
        return;
    }
//    _image = image;
    _image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.layer.contents = (__bridge id _Nullable)(_image.CGImage);
    [self updateDraw];
}

-(void)setContentMode:(UIViewContentMode)contentMode {
    if (super.contentMode == contentMode) {
        return;
    }
    [super setContentMode:contentMode];
    [self updateDraw];
}

NSString* get_contents_gravity(UIViewContentMode contentMode) {
    switch (contentMode) {
        case UIViewContentModeScaleToFill:
            return kCAGravityResize;
            break;
        case UIViewContentModeScaleAspectFit:
            return kCAGravityResizeAspect;
            break;
        case UIViewContentModeScaleAspectFill:
            return kCAGravityResizeAspectFill;
            break;
        case UIViewContentModeRedraw:
            return kCAGravityResize;
            break;
        case UIViewContentModeCenter:
            return kCAGravityCenter;
            break;
        case UIViewContentModeTop:
            return kCAGravityTop;
            break;
        case UIViewContentModeBottom:
            return kCAGravityBottom;
            break;
        case UIViewContentModeLeft:
            return kCAGravityLeft;
            break;
        case UIViewContentModeRight:
            return kCAGravityRight;
            break;
        case UIViewContentModeTopLeft:
            return kCAGravityTopLeft;
            break;
        case UIViewContentModeTopRight:
            return kCAGravityTopRight;
            break;
        case UIViewContentModeBottomLeft:
            return kCAGravityBottomLeft;
            break;
        case UIViewContentModeBottomRight:
            return kCAGravityBottomRight;
            break;
    }
}

@end
