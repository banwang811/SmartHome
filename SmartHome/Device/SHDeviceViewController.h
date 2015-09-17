//
//  SHDeviceViewController.h
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHBaseViewController.h"

@interface SHDeviceViewController : SHBaseViewController

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;

- (void)reloadData;

- (void)addDevice;

@end
