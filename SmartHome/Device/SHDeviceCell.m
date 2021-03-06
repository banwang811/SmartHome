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


- (void)setModel:(NSDeviceModel *)model
{
    self.nameLabel.text = model.deviceName;
    self.imageView.image = [UIImage imageNamed:model.deviceIcon];
    self.rangeLabel.text = model.extension;
    BOOL show = [self showControlButton:model.deviceType];
    self.controlButton.hidden = !show;
    if (show)
    {
        if (model.deviceState == NSDeviceModelState_On)
        {
            [self.controlButton setTitle:@"打开" forState:UIControlStateNormal];
        }else
        {
            [self.controlButton setTitle:@"关闭" forState:UIControlStateNormal];
        }
    }
    _model = model;
}

- (BOOL)showControlButton:(NSDeviceModelType)deviceType
{
    BOOL isShow = NO;
    switch (deviceType) {
        case NSDeviceModelType_Light:
            isShow = YES;
            break;
        case NSDeviceModelType_DimmingLight:
            isShow = YES;
            break;
        case NSDeviceModelType_TV:
            isShow = NO;
            break;
        case NSDeviceModelType_Aircondition:
            isShow = NO;
            break;
        case NSDeviceModelType_Socket:
            isShow = YES;
            break;
        case NSDeviceModelType_Curtain:
            isShow = YES;
            break;
        case NSDeviceModelType_FloorHeating:
            isShow = YES;
            break;
        case NSDeviceModelType_OpenStaircase:
            isShow = YES;
            break;
        case NSDeviceModelType_THTB:
            isShow = YES;
            break;
        case NSDeviceModelType_Camera:
            isShow = YES;
            break;
        default:
            break;
    }
    return isShow;
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
