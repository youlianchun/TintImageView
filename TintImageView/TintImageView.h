//
//  TintImageView.h
//  Test
//
//  Created by YLCHUN on 2017/11/9.
//  Copyright © 2017年 YLCHUN. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface TintImageView : UIImageView

@property(nonatomic, strong) IBInspectable UIColor *tintNormal;

@property(nonatomic, strong) IBInspectable UIColor *tintHighlighted;

-(UIColor *)tintColor NS_UNAVAILABLE;

-(void)setTintColor:(UIColor *)tintColor NS_UNAVAILABLE;

@end
