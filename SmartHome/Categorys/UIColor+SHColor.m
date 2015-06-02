//
//  UIColor+SHColor.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "UIColor+SHColor.h"

#define XHPomegranateColor ([UIColor colorWithRed:0.75 green:0.23 blue:0.19 alpha:1])
#define XHAlizarinColor ([UIColor colorWithRed:0.9 green:0.3 blue:0.26 alpha:1])
#define XHPumpkinColor ([UIColor colorWithRed:0.82 green:0.33 blue:0.1 alpha:1])
#define XHCarrotColor ([UIColor colorWithRed:0.9 green:0.3 blue:0.26 alpha:1])
#define XHOrangeColor ([UIColor colorWithRed:0.95 green:0.61 blue:0.17 alpha:1])
#define XHSunFlowerColor ([UIColor colorWithRed:0.94 green:0.76 blue:0.19 alpha:1])
#define XHNephritisColor ([UIColor colorWithRed:0.19 green:0.68 blue:0.39 alpha:1])
#define XHEmeraldColor ([UIColor colorWithRed:0.22 green:0.79 blue:0.45 alpha:1])
#define XHGreenSeaColor ([UIColor colorWithRed:0.14 green:0.62 blue:0.52 alpha:1])
#define XHTurquoiseColor ([UIColor colorWithRed:0.16 green:0.73 blue:0.61 alpha:1])
#define XHBelizeColor ([UIColor colorWithRed:0.18 green:0.51 blue:0.72 alpha:1])
#define XHPeterRiverColor ([UIColor colorWithRed:0.23 green:0.6 blue:0.85 alpha:1])
#define XHWisteriaColor ([UIColor colorWithRed:0.55 green:0.28 blue:0.67 alpha:1])
#define XHAmethystColor ([UIColor colorWithRed:0.6 green:0.36 blue:0.71 alpha:1])
#define XHCloudsColor ([UIColor colorWithRed:0.98 green:0.99 blue:0.99 alpha:1])
#define XHSilverColor ([UIColor colorWithRed:0.74 green:0.76 blue:0.78 alpha:1])
#define XHConcereteColor ([UIColor colorWithRed:0.58 green:0.65 blue:0.65 alpha:1])
#define XHAsbestosColor ([UIColor colorWithRed:0.5 green:0.55 blue:0.55 alpha:1])
#define XHMidnightColor ([UIColor colorWithRed:0.18 green:0.24 blue:0.31 alpha:1])
#define XHAsphaltColor ([UIColor colorWithRed:0.21 green:0.29 blue:0.36 alpha:1])



@implementation UIColor (SHColor)

+ (UIColor *)themeColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self colorModelAtIndex:[defaults integerForKey:@"XHThemeColor"]];
}

+ (UIColor *)textColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self colorModelAtIndex:[defaults integerForKey:@"XHTextColor"]];
}

+ (UIColor *)defaultColor
{
    return XHColor;
}

+ (UIColor *)temperatureColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self colorModelAtIndex:[defaults integerForKey:@"XHTemperatureColor"]];
}

+ (UIColor *)humidityColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self colorModelAtIndex:[defaults integerForKey:@"XHHumidityColor"]];
}

+ (UIColor *)smokeColor
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [self colorModelAtIndex:[defaults integerForKey:@"XHSmokeColor"]];
}

+ (UIColor *)colorModelAtIndex:(NSInteger)index
{
    UIColor *color = [[UIColor alloc] init];
    switch (index) {
        case 0: color = XHPomegranateColor; break;
        case 1: color = XHAlizarinColor; break;
        case 2: color = XHPumpkinColor; break;
        case 3: color = XHCarrotColor; break;
        case 4: color = XHOrangeColor; break;
        case 5: color = XHSunFlowerColor; break;
        case 6: color = XHNephritisColor; break;
        case 7: color = XHEmeraldColor; break;
        case 8: color = XHGreenSeaColor; break;
        case 9: color = XHTurquoiseColor; break;
        case 10: color = XHBelizeColor; break;
        case 11: color = XHPeterRiverColor; break;
        case 12: color = XHWisteriaColor; break;
        case 13: color = XHAmethystColor; break;
        case 14: color = XHConcereteColor; break;
        case 15: color = XHSilverColor; break;
        case 16: color = XHConcereteColor; break;
        case 17: color = XHAsbestosColor; break;
        case 18: color = XHAsphaltColor; break;
        case 19: color = XHMidnightColor; break;
        default: color = XHColor; break;
    }
    
    return color;
}



@end
