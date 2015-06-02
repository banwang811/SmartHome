//
//  SHLoginViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginViewController.h"
#import "AppDelegate.h"
#import "SHTabBarController.h"
@interface SHLoginViewController ()


@property (nonatomic, strong) UIButton          *logInButton;

@end

@implementation SHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupContentView];
    // Do any additional setup after loading the view.
}

- (void)setupContentView
{
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logInButton.frame = CGRectMake(100, 100, 200, 40);
    self.logInButton.backgroundColor = [UIColor defaultColor];
    [self.logInButton setTitle:@"login" forState:UIControlStateNormal];
    [self.logInButton addTarget:self action:@selector(logInButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.logInButton];
}

- (void)logInButtonClick
{
    SHTabBarController *tabBarController = [[SHTabBarController alloc] init];
    SHAPP_DELEGATE.tabBarController = tabBarController;

    SHAPP_DELEGATE.window.rootViewController = SHAPP_DELEGATE.tabBarController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
