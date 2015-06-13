//
//  SHLoginView.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginView.h"

#define originY 200

#define Height  40


@interface SHLoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton          *logInButton;

@property (nonatomic, strong) UILabel           *logoLabel;

@property (nonatomic, strong) UITextField       *numberTextField;

@property (nonatomic, strong) UITextField       *passwordTextField;

@end

@implementation SHLoginView

- (id)init
{
    if (self = [super init]) {
        [self setupContentView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView
{
    self.logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, self.frame.size.width - 160,Height)];
    self.logoLabel.text = @"华郡智能家居系统";
    self.logoLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.logoLabel];
    
    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,originY, self.frame.size.width - 80,Height)];
    self.numberTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.placeholder = @"账号";
    self.numberTextField.delegate = self;
    [self addSubview:self.numberTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,originY + 44 + 20, self.frame.size.width - 80,Height)];
    self.passwordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.delegate = self;
    [self addSubview:self.passwordTextField];
    
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logInButton.frame = CGRectMake(40, 350, self.frame.size.width - 80, Height);
    self.logInButton.backgroundColor = [UIColor defaultColor];
    [self.logInButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.logInButton addTarget:self action:@selector(logInButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.logInButton];
}

#pragma mark - UITextFieldDelegate


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.frame = CGRectMake(0, 100, self.frame.size.width, self.frame.size.height);
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.numberTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)logInButtonClick
{
    if (self.loginBlock) {
        self.loginBlock();
    }
}

@end
