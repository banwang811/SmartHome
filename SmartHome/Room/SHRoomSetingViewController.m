//
//  SHRoomSetingViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomSetingViewController.h"
#import "SHRoomTableViewCell.h"
#import "SHRoomSetingModel.h"

@interface SHRoomSetingViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSMutableArray        *models;

@end

@implementation SHRoomSetingViewController

- (id)init
{
    if (self = [super init])
    {
        self.models = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupContentView];
    [self reloadData];
}

- (void)reloadData
{
    
}

- (void)setupContentView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 104;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UITableViewCellIdenfifierKey";
    SHRoomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[SHRoomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];
    SHRoomCellModel *model = self.models[indexPath.row];
    cell.model = model;
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

@end
