//
//  NSDeviceModel.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSMeapDBBaseObject.h"

typedef enum{
    NSDeviceModelState_On,
    NSDeviceModelState_Stop,
    NSDeviceModelState_Off,
}NSDeviceModelState;

typedef enum{
    NSDeviceModelType_Light,//普通灯
    NSDeviceModelType_DimmingLight,//调光灯
    NSDeviceModelType_TV,//电视
    NSDeviceModelType_Aircondition,//空调
    NSDeviceModelType_Socket,//智能插座
    NSDeviceModelType_Curtain,//窗帘
    NSDeviceModelType_FloorHeating,//地暖
    NSDeviceModelType_OpenStaircase,//开窗器
    NSDeviceModelType_THTB,//温湿度传感器
    NSDeviceModelType_Camera,//摄像头控制
}NSDeviceModelType;

@interface NSDeviceModel : NSMeapDBBaseObject

@property (nonatomic, assign) NSInteger             deviceID;

@property (nonatomic, strong) NSString              *deviceName;

@property (nonatomic, strong) NSString              *deviceIcon;

@property (nonatomic, strong) NSString              *extension;

@property (nonatomic, assign) NSDeviceModelState    deviceState;

@property (nonatomic, assign) NSDeviceModelType     deviceType;
/*
 address = "";
 brand = 0;
 "created_at" = "2015-11-07 07:16:17";
 id = 508;
 imei = 11fefefe;
 index = 1;
 infrared = 0;
 model = 0;
 name = "\U6d4b\U8bd5\U706f1";
 nodeID = 8180;
 "room_id" = 502;
 status = 0;
 type = 1;
 "updated_at" = "2015-11-07 07:16:17";
 "user_id" = 52;
 */

+ (NSArray *)fetchDevices:(NSString *)deviceID;

+ (void)deleteDevice:(NSString *)deviceID;

+ (void)feacthDevices:(NSString *)roomID complete:(void(^)())comlete;

@end
