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
    if (model.deviceState == NSDeviceModelState_On)
    {
        [self.controlButton setTitle:@"打开" forState:UIControlStateNormal];
    }else
    {
        [self.controlButton setTitle:@"关闭" forState:UIControlStateNormal];
    }
    _model = model;
}

- (IBAction)changState:(UIButton *)sender {
    if (self.controlStateClick)
    {
        self.controlStateClick();
    }
}

- (IBAction)deleteDevice:(UIButton *)sender {
    if (self.deleteDeviceClick)
    {
        self.deleteDeviceClick();
    }
}

- (void)changeDeviceState:(NSString *)string{
    [self.controlButton setTitle:string forState:UIControlStateNormal];
}

@end
