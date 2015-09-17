//
//  NSDeviceModel.m
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSDeviceModel.h"

@implementation NSDeviceModel

/**
 *  读取数据库 更新本地数据
 */
+ (NSArray *)fetchDevices:(NSString *)deviceID;
{
    NSArray *array = nil;
    if (deviceID == nil)
    {
       array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                         conditions:nil
                                                               args:nil
                                                              order:nil];
    }
    else
    {
        array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                         conditions:@"deviceID = ?"
                                                               args:[NSArray arrayWithObjects:deviceID, nil]
                                                              order:nil];
    }
    return array;
}

/**
 *  将对象保存到数据库
 */
- (void)saveDB
{
    [[NSMeapDB shareMeap] createTable:[self class]];
    // 存数据库
    NSArray *array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                     conditions:@"deviceID = ?"
                                                           args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.deviceID], nil]
                                                          order:nil];
    if (array == nil || [array count] == 0)
    {
        [[NSMeapDB shareMeap] insertTable:[self class] object:self];
    }
//    if (array && [array count] > 0)
//    {
//        NSDeviceModel *device = [array objectAtIndex:0];
//        NSString *dbId = [NSString stringWithFormat:@"%ld",device.meap_id];
//        self.meap_id = [dbId integerValue];
//        [[NSMeapDB shareMeap] updateTable:[self class] object:self];
//    }
//    else
//    {
//        [[NSMeapDB shareMeap] insertTable:[self class] object:self];
//    }
}

/**
 *  更新数据库对象
 */
- (void)uploadDB
{
    NSArray *array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                     conditions:@"deviceID = ?"
                                                           args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.deviceID], nil]
                                                          order:nil];
    if (array && [array count] > 0)
    {
        NSDeviceModel *deviceModel = [array objectAtIndex:0];
        NSString *dbId = [NSString stringWithFormat:@"%ld",deviceModel.meap_id];
        self.meap_id = [dbId integerValue];
        [[NSMeapDB shareMeap] updateTable:[self class] object:self];
    }
    else
    {
        [[NSMeapDB shareMeap] insertTable:[self class] object:self];
    }
}

/**
 *  从数据库删除对象
 */
- (void)deleteDB
{
    [[NSMeapDB shareMeap] deleteFromTable:[self class] conditions:@"deviceID = ?"
                                     args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.deviceID], nil]];
}

+ (void)deleteDevice:(NSString *)deviceID
{
     [[NSMeapDB shareMeap] deleteFromTable:[self class] conditions:@"deviceID = ?"
                                     args:[NSArray arrayWithObjects:deviceID, nil]];
}


@end
