//
//  SHHomeViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHHomeViewController.h"


#define speaceX 15
#define speaceY 15

@interface SHHomeViewController ()

@property (nonatomic, strong) UIView                            *quickSceneView;

@property (nonatomic, strong) UIView                            *warnMessageView;

@property (nonatomic, strong) UIView                            *otherMessageView;

@property (nonatomic, strong) UIView                            *pushMessageView;

@property (nonatomic, strong) UIView                            *monitoringView;

@property (nonatomic, strong) UIView                            *companyInfoView;


@end

@implementation SHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViewController];
}

- (void)setupSubViewController
{
    CGFloat width1 = (self.view.frame.size.width - 3 *speaceX)/2;
    CGFloat hight = (self.view.frame.size.height -64 - 5 *speaceY)/4;
    
    
    self.quickSceneView = [[UIView alloc] initWithFrame:CGRectMake(speaceX, speaceY + 64, width1, hight *2 + speaceY)];
    self.quickSceneView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label.text = @"场景快捷方法，开发中";
    label.font = [UIFont systemFontOfSize:12];
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.quickSceneView addSubview:label];
    [self.view addSubview:self.quickSceneView];
    
    self.warnMessageView = [[UIView alloc] initWithFrame:CGRectMake(width1 + 2*speaceX, speaceY + 64, width1, hight)];
    self.warnMessageView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:self.warnMessageView];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label2.text = @"报警信息，开发中";
    label2.font = [UIFont systemFontOfSize:12];
    label2.numberOfLines = 0;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    [self.warnMessageView addSubview:label2];
    
    self.otherMessageView = [[UIView alloc] initWithFrame:CGRectMake(width1 + 2 *speaceX, speaceY*2 +hight + 64, width1, hight)];
    self.otherMessageView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:self.otherMessageView];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label3.text = @"其他信息，开发中";
    label3.font = [UIFont systemFontOfSize:12];
    label3.numberOfLines = 0;
    label3.lineBreakMode = NSLineBreakByWordWrapping;
    [self.otherMessageView addSubview:label3];
    
    self.pushMessageView = [[UIView alloc] initWithFrame:CGRectMake(speaceX, speaceY *3 + hight *2 + 64, self.view.frame.size.width - 2* speaceX, hight)];
    self.pushMessageView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:self.pushMessageView];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label4.text = @"推送信息，开发中";
    label4.font = [UIFont systemFontOfSize:12];
    label4.numberOfLines = 0;
    label4.lineBreakMode = NSLineBreakByWordWrapping;
    [self.pushMessageView addSubview:label4];
    
    self.companyInfoView = [[UIView alloc] initWithFrame:CGRectMake(speaceX, speaceY *4  + 64+ hight *3, width1, hight)];
    self.companyInfoView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:self.companyInfoView];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label5.text = @"公司详情，开发中";
    label5.font = [UIFont systemFontOfSize:12];
    label5.numberOfLines = 0;
    label5.lineBreakMode = NSLineBreakByWordWrapping;
    [self.companyInfoView addSubview:label5];
    
    
    self.monitoringView = [[UIView alloc] initWithFrame:CGRectMake(speaceX *2 + self.companyInfoView.frame.size.width , self.companyInfoView.frame.origin.y, width1, hight)];
    self.monitoringView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.view addSubview:self.monitoringView];
    
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
    label6.text = @"摄像头，开发中";
    label6.font = [UIFont systemFontOfSize:12];
    label6.numberOfLines = 0;
    label6.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label6];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
