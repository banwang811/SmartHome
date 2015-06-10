//
//  SHRoomViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomViewController.h"
#import "SHRoomTableViewCell.h"
#import "SHRoomCellModel.h"
#import "NSRoomModel.h"

@interface SHRoomViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSMutableArray        *models;

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
    for (int i= 0; i < 20; i ++)
    {
        NSRoomModel *model = [[NSRoomModel alloc] init];
        model.roomID = [NSString stringWithFormat:@"%d",i];
        model.roomIcon = [NSString stringWithFormat:@"image%d",i];
        model.roomName = [NSString stringWithFormat:@"房间%d",i];
        [model saveDB];
    }
    for (int i= 0; i < 20; i ++)
    {
        NSString *str = [[NSString alloc] initWithFormat:@"房间%d",i];
        SHRoomCellModel *model = [SHRoomCellModel itemWithTitle:str iconName:@""];
        [self.models addObject:model];
    }
    [self.tableView reloadData];
}

- (void)setupContentView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    SHRoomCellModel *model = self.models[indexPath.row];
    cell.model = model;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
