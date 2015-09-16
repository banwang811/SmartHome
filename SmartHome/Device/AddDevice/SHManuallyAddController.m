//
//  SHManuallyAddController.m
//  SmartHome
//
//  Created by banwang on 15/6/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHManuallyAddController.h"

@interface SHManuallyAddController ()

@end

@implementation SHManuallyAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, SCREEN_WIDTH, 40);
    [button addTarget:self action:@selector(addDevice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

/*
 name、room_id、type、infrared(1为红外设备，0为非红外设备)、brand、model
 成功返回结果 	error = 0 且列出设备信息{"id":"501","user_id":"51","room_id":"0","name":"testDevice1","type":"9","brand":"0","model":"0","infrared":"0","status":"0","created_at":"2015-08-04 00:02:54","updated_at":"2015-08-04 00:02:54","error":0}
 */

- (void)addDevice{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"name":@"灯",
                                 @"room_id":@"",
                                 @"type":@"9",
                                 @"brand":@"0",
                                 @"model":@"0",};
    [manager POST:@"http://121.40.30.197/api/device" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if (![dict isKindOfClass:[NSNull class]]) {
        
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
