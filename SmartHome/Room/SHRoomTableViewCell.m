//
//  SHRoomTableViewCell.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomTableViewCell.h"

@interface SHRoomTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation SHRoomTableViewCell

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];
}

- (void)setModel:(SHRoomCellModel *)model
{
//    self.headImage.image = [UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.title;
    _model = model;
}

@end
