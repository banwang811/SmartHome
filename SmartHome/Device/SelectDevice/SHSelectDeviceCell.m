//
//  SHAddDeviceCell.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSelectDeviceCell.h"

@interface SHSelectDeviceCell()

@property (weak, nonatomic) IBOutlet UIImageView *showIcon;

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SHSelectDeviceCell

- (void)setModel:(SHSelectDeviceModel *)model
{
    self.headImage.image = [UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.title;
    if (model.hasSelected) {
        self.showIcon.image = [UIImage imageNamed:@"hasSelected"];
        self.showIcon.backgroundColor = [UIColor redColor];

    }else{
        self.showIcon.image = [UIImage imageNamed:@"unSelected"];
        self.showIcon.backgroundColor = [UIColor grayColor];
    }
}

@end
