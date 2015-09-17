//
//  NSRoomModel.m
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSRoomModel.h"

@implementation NSRoomModel

/**
 *  读取数据库 更新本地数据
 */
+ (NSArray *)fetchRooms
{
    NSArray *array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                     conditions:nil
                                                           args:nil
                                                          order:nil];
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
                                                         conditions:@"roomID = ?"
                                                               args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.roomID], nil]
                                                              order:nil];
    if (array && [array count] > 0)
    {
        NSRoomModel *room = [array objectAtIndex:0];
        NSString *dbId = [NSString stringWithFormat:@"%ld",room.meap_id];
        self.meap_id = [dbId integerValue];
        [[NSMeapDB shareMeap] updateTable:[self class] object:self];
    }
    else
    {
        [[NSMeapDB shareMeap] insertTable:[self class] object:self];
    }
}

/**
 *  更新数据库对象
 */
- (void)uploadDB
{
    NSArray *array = [[NSMeapDB shareMeap] queryObjectFromTable:[self class]
                                                     conditions:@"roomID = ?"
                                                           args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.roomID], nil]
                                                          order:nil];
    if (array && [array count] > 0)
    {
        NSRoomModel *room = [array objectAtIndex:0];
        NSString *dbId = [NSString stringWithFormat:@"%ld",room.meap_id];
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
    [[NSMeapDB shareMeap] deleteFromTable:[self class] conditions:@"roomID = ?"
                                     args:[NSArray arrayWithObjects:[NSNumber numberWithInteger:self.roomID], nil]];
}


+ (void)deleteDB:(NSString *)roomID
{
    [[NSMeapDB shareMeap] deleteFromTable:[self class] conditions:@"roomID = ?"
                                     args:[NSArray arrayWithObjects:roomID,nil]];
}


@end
