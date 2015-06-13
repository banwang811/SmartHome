//
//  SHForgetPasswordController.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHForgetPasswordController.h"

@interface SHForgetPasswordController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField               *numberTextField;

@property (nonatomic, strong) UIButton                  *sureButton;

@end

@implementation SHForgetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupContentView];
}

- (void)setupContentView
{
    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,64 + 40, self.view.frame.size.width - 80,40)];
    self.numberTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.placeholder = @"请输入手机号";
    self.numberTextField.delegate = self;
    [self.view addSubview:self.numberTextField];
    
    
    self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureButton.frame = CGRectMake(40, 64 + 40 +40 +40, self.view.frame.size.width - 80, 40);
    self.sureButton.backgroundColor = [UIColor defaultColor];
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.sureButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sureButton];
}

- (void)buttonClick
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"找回密码";
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
