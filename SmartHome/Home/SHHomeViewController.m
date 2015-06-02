//
//  SHHomeViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHHomeViewController.h"
#import "SHContentView.h"

@interface SHHomeViewController ()<SHContentViewDelegate>

@end

@implementation SHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViewController];
}

- (void)setupSubViewController
{
    SHContentView *customView = [[SHContentView alloc] initWithFrame:self.view.bounds parentView:self.view];
    [[customView layer] setShadowOffset:CGSizeMake(10, 10)];
    [[customView layer] setShadowRadius:20];
    [[customView layer] setShadowOpacity:1];
    [[customView layer] setShadowColor:[UIColor blackColor].CGColor];
    customView.backgroundColor = [UIColor redColor];
    [self.view addSubview:customView];
}


- (void)panContentView
{
    SHAPP_DELEGATE.tabBarController.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
