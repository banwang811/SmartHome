//
//  SHRoomTableViewCell.h
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTableViewCell.h"
#import "NSRoomModel.h"

@interface SHRoomTableViewCell : SHTableViewCell

@property (nonatomic, strong) NSRoomModel  *model;

@property (nonatomic, copy)   void(^deleteRoom)();

@end
