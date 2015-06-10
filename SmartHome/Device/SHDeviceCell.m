//
//  SHDeviceCell.m
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHDeviceCell.h"

@interface SHDeviceCell()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *rangeLabel;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (weak, nonatomic) IBOutlet UIButton *controlButton;


@end

@implementation SHDeviceCell

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];
}


- (void)setModel:(SHDeviceModel *)model
{
    self.nameLabel.text = model.title;
    self.imageView.image = [UIImage imageNamed:model.iconName];
    self.rangeLabel.text = model.rangeName;
    _model = model;
}

@end
