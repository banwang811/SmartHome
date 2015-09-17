//
//  SHScenceDeviceController.m
//  SmartHome
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHScenceDeviceController.h"
#import "SHSelectViewController.h"

@interface SHScenceDeviceController ()

@end

@implementation SHScenceDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadData{
    
}

- (void)addDevice{
    SHSelectViewController *controller = [[SHSelectViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
