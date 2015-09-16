//
//  SHBaseViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHBaseViewController.h"

@interface SHBaseViewController ()

@property (nonatomic, strong) MBProgressHUD         *hud;

@end

@implementation SHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.hud];
}

- (MBProgressHUD *)hud{
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
        _hud.opacity = 0.5;
        [_hud hide:YES];
    }
    return _hud;
}

- (void)showHudView:(NSString *)string{
    _hud.labelText = string;
    [_hud show:YES];
}

- (void)hideHudView{
    [_hud hide:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
