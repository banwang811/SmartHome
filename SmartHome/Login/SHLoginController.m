//
//  SHLoginController.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginController.h"
#import "SHRegisterController.h"
#import "SidebarViewController.h"

@interface SHLoginController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation SHLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor shlightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{

}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.accountTextField) {
        [SHAccountManager shareManager].account = textField.text;
    }else{
        [SHAccountManager shareManager].password = textField.text;
    }
}

- (IBAction)longin:(UIButton *)sender {
    [self showHudView:@"登陆中..."];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameter=@{@"phone":@"13691495062",
                              @"password":@"123"};
    [manager POST:[NSString stringWithFormat:@"%@%@",serverAddress,login] parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            SHAPP_DELEGATE.window.rootViewController = SHAPP_DELEGATE.mainController;
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

- (IBAction)forgetPassword:(UIButton *)sender {
    
}

- (IBAction)registerClick:(UIButton *)sender {
    SHRegisterController *controller = [[SHRegisterController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
