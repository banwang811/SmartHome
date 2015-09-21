//
//  SHRoomDeviceController.m
//  SmartHome
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomDeviceController.h"
#import "SHSelectDeviceController.h"

@interface SHRoomDeviceController ()

@end

@implementation SHRoomDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设备组合";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadData{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@/room/%ld/device",serverAddress,self.roomID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            [self.models removeAllObjects];
            NSArray *roomInfos = [dict objectForKey:@"devices"];
            for (NSDictionary *info in roomInfos) {
                NSDeviceModel *model = [[NSDeviceModel alloc] init];
                model.deviceName = [info objectForKey:@"name"];
                model.deviceID = [[info objectForKey:@"id"] integerValue];
                [self.models addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

//- (void)addDevice{
//    SHSelectDeviceController *controller = [[SHSelectDeviceController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
//}

- (void)addDevice{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"name":@"灯",
                                 @"room_id":[NSNumber numberWithInteger:self.roomID],
                                 @"type":@"1",
                                 @"infrared":@"0",
                                 @"brand":@"0",
                                 @"model":@"0",
                                 @"imei":@"0"};
    [manager POST:[NSString stringWithFormat:@"%@%@",serverAddress,device] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

@end
