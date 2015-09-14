//
//  SHSelectViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSelectViewController.h"
#import "SHSelectDeviceCell.h"
#import "SHSelectDeviceModel.h"

@interface SHSelectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;

@end

@implementation SHSelectViewController

- (id)init
{
    if (self = [super init]) {
        self.models = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupContentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)reloadData
{
    for (int i= 0; i < 20; i ++)
    {
        NSDeviceModel *model = [[NSDeviceModel alloc] init];
        model.deviceName = [[NSString alloc] initWithFormat:@"设备%d",i];
        model.deviceID = [[NSString alloc] initWithFormat:@"设备%d",i];
        [model saveDB];
    }
    NSArray *devices = [NSDeviceModel fetchDevices:nil];
    [self.models removeAllObjects];
    for (NSDeviceModel *model in devices)
    {
        SHSelectDeviceModel *cellModel = [[SHSelectDeviceModel alloc] init];
        cellModel.title = model.deviceName;
        cellModel.Id = model.deviceID;
        cellModel.iconName = model.deviceIcon;
        [self.models addObject:cellModel];
    }
    [self.tableView reloadData];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"选择设备";
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
    static NSString *cellIdentifier = @"SHSelectDeviceCell";
    SHSelectDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSelectDeviceCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    SHSelectDeviceModel *model = self.models[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHSelectDeviceModel  *mode =  [self.models objectAtIndex:indexPath.row];
    SHSelectDeviceCell *cell = (SHSelectDeviceCell *)[tableView cellForRowAtIndexPath:indexPath];
    mode.hasSelected = !mode.hasSelected;
    cell.model = mode;
}

@end
