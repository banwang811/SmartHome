//
//  NSDeviceModel.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSMeapDBBaseObject.h"

@interface NSDeviceModel : NSMeapDBBaseObject

@property (nonatomic, strong) NSString              *deviceID;

@property (nonatomic, strong) NSString              *deviceName;

@property (nonatomic, strong) NSString              *deviceIcon;

@property (nonatomic, strong) NSString              *extension;

@end
