//
//  SHRegisterController.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRegisterController.h"

@interface SHRegisterController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField                       *numberTextField;

@property (nonatomic, strong) UITextField                       *verificationTextField;

@property (nonatomic, strong) UITextField                       *passwordTextField;

@property (nonatomic, strong) UITextField                       *repasswordTextField;

@property (nonatomic, strong) UIButton                          *sureButton;

@property (nonatomic, strong) UIButton                          *verificationButton;

@end

@implementation SHRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupContentView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"注册";
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupContentView
{
    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,64 + 40, self.view.frame.size.width - 80,40)];
    self.numberTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.placeholder = @"请输入手机号";
    self.numberTextField.delegate = self;
    [self.view addSubview:self.numberTextField];
    
    self.verificationTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.numberTextField.frame.origin.y + 40 +20, 180,40)];
    self.verificationTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.verificationTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.verificationTextField.placeholder = @"请输入验证码";
    self.verificationTextField.delegate = self;
    [self.view addSubview:self.verificationTextField];
    
    self.verificationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.verificationButton.frame = CGRectMake(self.view.frame.size.width - 80 -40, self.numberTextField.frame.origin.y + 40 +20,80, 40);
    self.verificationButton.backgroundColor = [UIColor defaultColor];
    self.verificationButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.verificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.verificationButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.verificationButton];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.verificationTextField.frame.origin.y + 40 +20, self.view.frame.size.width - 80,40)];
    self.passwordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"请输入密码";
    self.passwordTextField.delegate = self;
    [self.view addSubview:self.passwordTextField];
    
    self.repasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.passwordTextField.frame.origin.y +40 +20, self.view.frame.size.width - 80,40)];
    self.repasswordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.repasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.repasswordTextField.placeholder = @"请确认密码";
    self.repasswordTextField.delegate = self;
    [self.view addSubview:self.repasswordTextField];
    
    self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureButton.frame = CGRectMake(40, self.repasswordTextField.frame.origin.y + 40 + 30, self.view.frame.size.width - 80, 40);
    self.sureButton.backgroundColor = [UIColor defaultColor];
    [self.sureButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [self.sureButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sureButton];
}

- (void)buttonClick
{
    
}

@end
