//
//  SHLoginView.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginView.h"

#define originY 130

#define Height  40


@interface SHLoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton          *logInButton;

@property (nonatomic, strong) UILabel           *logoLabel;

@property (nonatomic, strong) UITextField       *numberTextField;

@property (nonatomic, strong) UITextField       *passwordTextField;

@property (nonatomic, strong) UIButton          *forgetPassword;

@property (nonatomic, strong) UIButton          *registeredButton;

@end

@implementation SHLoginView

- (id)init{
    if (self = [super init]) {
        [self setupContentView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView{
    self.logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, self.frame.size.width - 160,Height)];
    self.logoLabel.text = @"华郡智能家居系统";
    self.logoLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.logoLabel];
    
    self.numberTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,originY, self.frame.size.width - 80,Height)];
    self.numberTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.numberTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.numberTextField.placeholder = @"账号";
    self.numberTextField.delegate = self;
    [self addSubview:self.numberTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.numberTextField.frame.origin.y + Height + 20, self.frame.size.width - 80,Height)];
    self.passwordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"密码";
    self.passwordTextField.delegate = self;
    [self addSubview:self.passwordTextField];
    
    self.forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetPassword.frame = CGRectMake(self.frame.size.width - 120, self.passwordTextField.frame.origin.y + Height + 20,80, 20);
    self.forgetPassword.titleLabel.font = [UIFont systemFontOfSize:13];
    self.forgetPassword.backgroundColor = [UIColor defaultColor];
    [self.forgetPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetPassword addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.forgetPassword];
    
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logInButton.frame = CGRectMake(40, self.passwordTextField.frame.origin.y + Height + 60, self.frame.size.width - 80, Height);
    self.logInButton.backgroundColor = [UIColor defaultColor];
    [self.logInButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.logInButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.logInButton];
    
    self.registeredButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registeredButton.frame = CGRectMake(40, self.logInButton.frame.origin.y + Height + 20 , self.frame.size.width - 80, Height);
    self.registeredButton.backgroundColor = [UIColor defaultColor];
    [self.registeredButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registeredButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.registeredButton];
}

#pragma mark - UITextFieldDelegate


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        if ([SHAdapter shareAdapter].isIphone4s) {
            self.frame = CGRectMake(0, 30, self.frame.size.width, self.frame.size.height);
        }else
        {
            self.frame = CGRectMake(0, 100, self.frame.size.width, self.frame.size.height);
        }
    }];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.numberTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)buttonClick:(UIButton *)button{
    if (button == self.logInButton) {
        if (self.loginBlock) {
            self.loginBlock();
        }
    }else if (button == self.registeredButton){
        if (self.registerBlock) {
            self.registerBlock();
        }
    }else if (button == self.forgetPassword){
        if (self.forgetBlock) {
            self.forgetBlock();
        }
    }
}

@end
