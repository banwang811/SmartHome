//
//  SHDeviceModel.h
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHCellModel.h"

@interface SHDeviceModel : SHCellModel

@property (nonatomic, strong) NSString              *rangeName;

@property (nonatomic, assign) NSDeviceModelState    deviceState;

@property (nonatomic, assign) NSDeviceModelType     deviceType;

@end
