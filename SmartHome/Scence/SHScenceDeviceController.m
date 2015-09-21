//
//  SHScenceDeviceController.m
//  SmartHome
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHScenceDeviceController.h"
#import "SHSelectDeviceController.h"

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
    SHDeviceViewController *controller = [[SHDeviceViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
