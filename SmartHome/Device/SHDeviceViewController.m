//
//  SHDeviceViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHDeviceViewController.h"
#import "SHSelectDeviceController.h"
//common
#import "SHDeviceCell.h"
//other
#import "SHTVControlController.h"
#import "SHAirconditionController.h"


@interface SHDeviceViewController ()<UITableViewDataSource,
                                    UITableViewDelegate,
                                    UIAlertViewDelegate>

@end

@implementation SHDeviceViewController
/*
NSDeviceModelType_Light,//普通灯
NSDeviceModelType_DimmingLight,//调光灯
NSDeviceModelType_TV,//电视
NSDeviceModelType_Aircondition,//空调
NSDeviceModelType_Socket,//智能插座
NSDeviceModelType_Curtain,//窗帘
NSDeviceModelType_FloorHeating,//地暖
NSDeviceModelType_OpenStaircase,//开窗器
NSDeviceModelType_THTB,//温湿度传感器
NSDeviceModelType_Camera,//摄像头控制
*/

- (instancetype)init{
    if (self == [super init]) {
        self.models = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setupContentView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadData];
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

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}


- (void)setupContentView{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addDevice)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)addDevice{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameters = @{@"name":@"灯",
                                 @"room_id":[NSNumber numberWithInteger:521],
                                 @"type":@"1",
                                 @"infrared":@"0",
                                 @"brand":@"0",
                                 @"model":@"0",};
    [manager POST:[NSString stringWithFormat:@"%@%@",serverAddress,device] parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

#pragma mark - tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self shtableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)shtableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SHDeviceCell";
    SHDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHDeviceCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDeviceModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self shtableView:tableView didSelectRowAtIndexPath:indexPath];
}


- (void)shtableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *controller = nil;
    NSDeviceModel *model = self.models[indexPath.row];
    switch (model.deviceType) {
        case NSDeviceModelType_Light:
            break;
        case NSDeviceModelType_DimmingLight:
            break;
        case NSDeviceModelType_TV:
            controller = [[SHTVControlController alloc] init];
            break;
        case NSDeviceModelType_Aircondition:
            controller = [[SHAirconditionController alloc] init];
            break;
        case NSDeviceModelType_Socket:
            break;
        case NSDeviceModelType_Curtain:
            break;
        case NSDeviceModelType_FloorHeating:
            break;
        case NSDeviceModelType_OpenStaircase:
            break;
        case NSDeviceModelType_THTB:
            break;
        case NSDeviceModelType_Camera:
            break;
        default:
            break;
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        return;
    }
}

@end
