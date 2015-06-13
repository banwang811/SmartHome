//
//  SHLoginViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHLoginViewController.h"
#import "AppDelegate.h"
#import "SidebarViewController.h"
#import "SHLoginView.h"
#import "SHForgetPasswordController.h"
#import "SHRegisterController.h"
@interface SHLoginViewController ()

@property (nonatomic, strong) SHLoginView               *loginView;

@end

@implementation SHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupContentView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)setupContentView
{
    if ([SHAdapter shareAdapter].isIphone4s){
        self.loginView = [[SHLoginView alloc] initWithFrame:CGRectMake(0, 30, SHWidth, SHHeight - 30)];
    }else{
        self.loginView = [[SHLoginView alloc] initWithFrame:CGRectMake(0, 100, SHWidth, SHHeight - 200)];
    }
    self.loginView.loginBlock = ^{
        SHAPP_DELEGATE.window.rootViewController = [[SidebarViewController alloc] initWithNibName:@"SidebarViewController" bundle:nil];
    };
    __weak SHLoginViewController *weakSelf = self;
    self.loginView.forgetBlock = ^{
        SHForgetPasswordController *forget = [[SHForgetPasswordController alloc] init];
        [weakSelf.navigationController pushViewController:forget animated:YES];
    };
    self.loginView.registerBlock = ^{
        SHRegisterController *controller = [[SHRegisterController alloc] init];
        [weakSelf.navigationController pushViewController:controller animated:YES];
    };
    [self.view addSubview:self.loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
