//
//  UIColor+SHColor.h
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define XHColor ([UIColor colorWithRed:255.0/255 green:185.0/255 blue:0.0/255 alpha:1.0f])
#define XHBlackColor ([UIColor colorWithRed:26/255.0f green:26/255.0f blue:26/255.0f alpha:1])
#define XHCellBackgroundColor ([UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1])

@interface UIColor (SHColor)

+ (UIColor *)themeColor;
+ (UIColor *)textColor;
+ (UIColor *)defaultColor;
+ (UIColor *)temperatureColor;
+ (UIColor *)humidityColor;
+ (UIColor *)smokeColor;


+ (UIColor *)shlightGrayColor;

+ (UIColor *)navagationBarColor;


@end
