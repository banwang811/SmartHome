//
//  SHCellModel.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHCellModel.h"

@implementation SHCellModel

+ (instancetype)itemWithTitle:(NSString *)title iconName:(NSString *)iconName
{
    SHCellModel *item = [[self alloc] init];
    item.title = title;
    item.iconName = iconName;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title iconName:nil];
}

@end
