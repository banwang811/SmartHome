//
//  SHRoomTableViewCell.h
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTableViewCell.h"
#import "SHRoomCellModel.h"

@interface SHRoomTableViewCell : SHTableViewCell

@property (nonatomic, strong) SHRoomCellModel  *model;

@property (nonatomic, copy)   void(^deleteRoom)();

@end
