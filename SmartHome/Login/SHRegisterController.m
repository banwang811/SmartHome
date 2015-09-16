//
//  SHRegisterController.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRegisterController.h"
#import "SidebarViewController.h"

@interface SHRegisterController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *ensureTextField;

@end

@implementation SHRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor shlightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)registerClick:(UIButton *)sender {
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameter=@{@"phone":@"13691495062",
                              @"password":@"123"};
    [manager POST:[NSString stringWithFormat:@"%@%@",serverAddress,registerUser] parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
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

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
