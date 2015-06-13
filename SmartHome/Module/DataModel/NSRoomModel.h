//
//  NSRoomModel.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSMeapDBBaseObject.h"

@interface NSRoomModel : NSMeapDBBaseObject

@property (nonatomic, strong) NSString              *roomID;

@property (nonatomic, strong) NSString              *roomName;

@property (nonatomic, strong) NSString              *roomIcon;

@property (nonatomic, strong) NSString              *roomMembers;

@property (nonatomic, strong) NSString              *deviceID;

@property (nonatomic, strong) NSString              *extension;

+ (NSArray *)fetchRooms;

+ (void)deleteDB:(NSString *)roomID;

@end
