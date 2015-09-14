//
//  SHDeviceCell.h
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTableViewCell.h"

@interface SHDeviceCell : SHTableViewCell

@property (nonatomic, strong) NSDeviceModel *model;

@property (nonatomic, copy) void (^controlStateClick)();

@property (nonatomic, copy) void (^deleteDeviceClick)();


- (void)changeDeviceState:(NSString *)string;

@end
