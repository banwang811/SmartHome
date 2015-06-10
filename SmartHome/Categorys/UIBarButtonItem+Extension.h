//
//  UIBarButtonItem+Extension.h
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highLightedImageName:(NSString *)highLightedImageName target:(id)target action:(SEL)action;

@end
