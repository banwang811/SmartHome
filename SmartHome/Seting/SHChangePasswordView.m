//
//  SHChangePasswordView.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHChangePasswordView.h"

#define originY (40 + 64 )
#define Height  40

@interface SHChangePasswordView()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField               *oldPasswordTextField;
@property (nonatomic, strong) UITextField               *passwordTextField;
@property (nonatomic, strong) UITextField               *resPasswordTextField;
@property (nonatomic, strong) UIButton                  *changeButton;

@end

@implementation SHChangePasswordView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView
{
    self.oldPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,originY, self.frame.size.width - 80,Height)];
    self.oldPasswordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.oldPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.oldPasswordTextField.placeholder = @"请输入密码";
    self.oldPasswordTextField.delegate = self;
    [self addSubview:self.oldPasswordTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.oldPasswordTextField.frame.origin.y + Height + 20, self.frame.size.width - 80,Height)];
    self.passwordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.placeholder = @"请输入新密码";
    self.passwordTextField.delegate = self;
    [self addSubview:self.passwordTextField];
    
    self.resPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,self.passwordTextField.frame.origin.y + Height + 20, self.frame.size.width - 80,Height)];
    self.resPasswordTextField.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.resPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.resPasswordTextField.placeholder = @"请重新输入密码";
    self.resPasswordTextField.delegate = self;
    [self addSubview:self.resPasswordTextField];
    
    
    self.changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeButton.frame = CGRectMake(40, self.resPasswordTextField.frame.origin.y + Height + 20 , self.frame.size.width - 80, Height);
    self.changeButton.backgroundColor = [UIColor defaultColor];
    [self.changeButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.changeButton addTarget:self action:@selector(changeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.changeButton];

}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.resPasswordTextField || textField == self.passwordTextField) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = CGRectMake(0, -100, self.frame.size.width, self.frame.size.height);
        }];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.resPasswordTextField || textField == self.passwordTextField) {
        [UIView animateWithDuration:0.3 animations:^{
            if ([SHAdapter shareAdapter].isIphone4s) {
                self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            }else
            {
                self.frame = CGRectMake(0, 100, self.frame.size.width, self.frame.size.height);
            }
        }];
    }
}

- (void)changeButtonClick
{
    if (self.changeBlcok) {
        self.changeBlcok(YES,nil);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.oldPasswordTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.resPasswordTextField resignFirstResponder];
}


@end
