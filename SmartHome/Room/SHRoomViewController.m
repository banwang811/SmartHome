//
//  SHRoomViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomViewController.h"
#import "SHRoomTableViewCell.h"
#import "NSRoomModel.h"
#import "SHRoomSetingViewController.h"
#import "SHDeviceViewController.h"

@interface SHRoomViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSMutableArray        *models;

@property (nonatomic, strong) NSString              *selectRoomID;

@end

@implementation SHRoomViewController

- (id)init
{
    if (self = [super init])
    {
        self.models = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
    [self reloadData];
}

- (void)reloadData
{
    NSArray *roomModels= [NSRoomModel fetchRooms];
    [self.models removeAllObjects];
    [self.models addObjectsFromArray:roomModels];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)setupContentView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addRooms)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addRooms
{
    SHRoomSetingViewController *setingController = [[SHRoomSetingViewController alloc] initWithType:SHSetingViewType_room];
    [self.navigationController pushViewController:setingController animated:YES];
}

#pragma mark - tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SHRoomTableViewCell";
    SHRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRoomTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    NSRoomModel *model = self.models[indexPath.row];
    cell.model = model;
    __weak SHRoomViewController *weakSelf = self;
    cell.deleteRoom = ^{
        weakSelf.selectRoomID = model.roomID;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"是否删除房间"
                                                       delegate:weakSelf
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
        [alert show];
    };
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHDeviceViewController *deviceController = [[SHDeviceViewController alloc] initWithType:SHDeviceViewController_combination];
    [self.navigationController pushViewController:deviceController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [NSRoomModel deleteDB:self.selectRoomID];
        [self reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
