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

@interface SHLoginViewController ()

@property (nonatomic, strong) SHLoginView               *loginView;

@end

@implementation SHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupContentView];
}

- (void)setupContentView
{
    self.loginView = [[SHLoginView alloc] initWithFrame:CGRectMake(0, 100, SHWidth, SHHeight - 200)];
    
    self.loginView.loginBlock = ^{
        SHAPP_DELEGATE.window.rootViewController = [[SidebarViewController alloc] initWithNibName:@"SidebarViewController" bundle:nil];
    };
    [self.view addSubview:self.loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
