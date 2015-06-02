//
//  SHRoomTableViewCell.h
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTableViewCell.h"
#import "SHRoomCellModel.m"
#import "SHRoomView.h"

@interface SHRoomTableViewCell : SHTableViewCell

@property (nonatomic, strong) SHRoomCellModel  *cellModel;

@property (nonatomic, strong) SHRoomView       *roomView;

@property (nonatomic, assign) CGFloat height;


@end
