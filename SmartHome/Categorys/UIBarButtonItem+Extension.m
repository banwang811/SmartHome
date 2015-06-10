//
//  UIBarButtonItem+Extension.m
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#define SHBtnWidthAndHeight 30

@implementation UIBarButtonItem (Extension)




+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highLightedImageName:(NSString *)highLightedImageName target:(id)target action:(SEL)action
{
    // custom UIView
    UIButton *btn = [[UIButton alloc] init];
    //btn.tintColor = [XHColorTools themeColor];
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    UIImage *highLightedIamge = [UIImage imageNamed:highLightedImageName];
    if (IOS_7_OR_LATER) {
        // here we should use UIImage's new property renderingMode,
        // and set renderingMode with UIImageRenderingModeAlwaysAutomatic
        // if we need to rendering the hightLighted image automatic according tintColor.
        // and if we need to use the original image, we should set renderingMode with
        // UIImageRenderingModeAlwaysOriginal.
        //selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //highLightedIamge = [highLightedIamge imageWithRenderingMode:UIImageRenderingModeAutomatic];
        //selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    
    [btn setBackgroundImage:highLightedIamge forState:UIControlStateHighlighted];
    
    // set frame
    [btn setFrame:CGRectMake(0, 2, SHBtnWidthAndHeight, SHBtnWidthAndHeight)];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
