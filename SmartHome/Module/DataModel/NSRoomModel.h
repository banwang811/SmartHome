//
//  NSRoomModel.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSMeapDBBaseObject.h"

@interface NSRoomModel : NSMeapDBBaseObject

@property (nonatomic, assign) NSInteger             roomID;

@property (nonatomic, strong) NSString              *roomName;

@property (nonatomic, strong) NSString              *roomIcon;

@property (nonatomic, strong) NSString              *extension;

@property (nonatomic, strong) NSString              *floor;

+ (NSArray *)fetchRooms;

+ (void)deleteDB:(NSString *)roomID;

@end
