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

- (void)setModel:(NSDeviceModel *)model
{
    self.headImage.image = [UIImage imageNamed:model.deviceIcon];
    self.nameLabel.text = model.deviceName;
    if (/* DISABLES CODE */ (1)) {
        self.showIcon.image = [UIImage imageNamed:@"hasSelected"];
        self.showIcon.backgroundColor = [UIColor redColor];

    }else{
        self.showIcon.image = [UIImage imageNamed:@"unSelected"];
        self.showIcon.backgroundColor = [UIColor grayColor];
    }
}

@end
