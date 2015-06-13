//
//  SHChangePasswordController.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//


#import "SHChangePasswordController.h"
#import "SHChangePasswordView.h"

@interface SHChangePasswordController ()<UIAlertViewDelegate>

@property (nonatomic, strong) SHChangePasswordView          *changeView;

@end

@implementation SHChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"修改密码";
}

- (void)setupContentView
{
    self.changeView = [[SHChangePasswordView alloc] initWithFrame:self.view.bounds];
    __weak SHChangePasswordController *blockSelf = self;
    self.changeView.changeBlcok = ^(BOOL success,SHError *error){
        if (success) {
            UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示"
                                                           message:@"修改成功"
                                                          delegate:blockSelf
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles:nil, nil];
            [view show];
        }
    };
    [self.view addSubview:self.changeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
