//
//  SHChangePasswordController.m
//  SmartHome
//
//  Created by mac on 15/9/15.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHChangePasswordController.h"

@interface SHChangePasswordController ()

@property (weak, nonatomic) IBOutlet UITextField *oldpassword;
@property (weak, nonatomic) IBOutlet UITextField *newpassword;
@property (weak, nonatomic) IBOutlet UITextField *ensurepassword;

@end

@implementation SHChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)changePassword:(UIButton *)sender {
    
}

@end
