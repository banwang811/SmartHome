//
//  UIImage+SHImage.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "UIImage+SHImage.h"

@implementation UIImage (SHImage)

+ (UIImage *)shImageNamed:(NSString *)name{
    NSString *imageName = [SHAPP_DELEGATE.imageDict objectForKey:name];
    imageName = (imageName == nil ? @"":imageName);
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

@end
