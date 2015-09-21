//
//  SHSelectDeviceController.m
//  SmartHome
//
//  Created by mac on 15/9/21.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSelectDeviceController.h"
#import "SHSelectDeviceCell.h"

@interface SHSelectDeviceController ()

@end

@implementation SHSelectDeviceController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (UITableViewCell *)shtableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SHSelectDeviceCell";
    SHSelectDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSelectDeviceCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDeviceModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)shtableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)reloadData{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",serverAddress,device] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            [self.models removeAllObjects];
            NSArray *roomInfos = [dict objectForKey:@"rooms"];
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



@end
