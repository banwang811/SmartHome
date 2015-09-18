//
//  SHRoomViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomViewController.h"
#import "SHRoomTableViewCell.h"
#import "SHRoomDeviceController.h"

@interface SHRoomViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSMutableArray        *models;

@property (nonatomic, assign) NSIndexPath           *indexPath;

@property (nonatomic, strong) NSString              *roomName;

@end

@implementation SHRoomViewController

- (id)init{
    if (self = [super init]){
        self.models = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fetchRooms];
}

- (void)setupContentView{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addRooms)];
    self.navigationItem.rightBarButtonItem = rightItem;
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

- (void)addRooms{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加房间"
                                                    message:@"请输入房间名称"
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定", nil];
    alert.tag = 100;
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

#pragma mark - tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SHRoomTableViewCell";
    SHRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRoomTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    NSRoomModel *model = self.models[indexPath.row];
    cell.model = model;
    cell.deleteRoom = ^(){
        self.indexPath = indexPath;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"是否删除房间"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
        alert.tag = 200;
        [alert show];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SHRoomDeviceController *deviceController = [[SHRoomDeviceController alloc] init];
    NSRoomModel *model = [self.models objectAtIndex:indexPath.row];
    deviceController.roomID = model.roomID;
    [self.navigationController pushViewController:deviceController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 200) {
        if (buttonIndex == 1){
            [self requestDeleteRoom];
        }
    }else{
        if (buttonIndex == 1){
            UITextField *textField = [alertView textFieldAtIndex:0];
            self.roomName = textField.text;
            [self requestAddRoom];
        }
    }
}

- (void)fetchRooms{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"%@%@",serverAddress,rooms] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            [self.models removeAllObjects];
            NSArray *roomInfos = [dict objectForKey:@"rooms"];
            for (NSDictionary *info in roomInfos) {
                NSRoomModel *model = [[NSRoomModel alloc] init];
                model.roomName = [info objectForKey:@"name"];
                model.roomID = [[info objectForKey:@"id"] integerValue];
                model.floor = [info objectForKey:@"floor"];
                [self.models addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}


- (void)requestAddRoom{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *parameter=@{@"name":self.roomName};
    [manager POST:[NSString stringWithFormat:@"%@%@",serverAddress,rooms] parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            NSRoomModel *model = [[NSRoomModel alloc] init];
            model.roomName = [dict objectForKey:@"name"];
            model.roomID = [[dict objectForKey:@"id"] integerValue];
            model.floor = [dict objectForKey:@"floor"];
            [self.models addObject:model];
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}

- (void)requestDeleteRoom{
    [self showHudView:nil];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSRoomModel *model = [self.models objectAtIndex:self.indexPath.row];
    [manager DELETE:[NSString stringWithFormat:@"%@%@/%ld",serverAddress,rooms,model.roomID] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self hideHudView];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if([[dict objectForKey:@"error"]integerValue] == 0){
            [self.models removeObject:model];
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self hideHudView];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
