//
//  SHScenceViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSceneViewController.h"
#import "SHSceneModel.h"
#import "SHSceneTableViewCell.h"


@interface SHSceneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;


@end

@implementation SHSceneViewController

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
    
    [self reloadData];
}

- (void)reloadData
{
    for (int i= 0; i < 20; i ++)
    {
        NSString *str = [[NSString alloc] initWithFormat:@"场景%d",i];
        SHSceneModel *model = [SHSceneModel itemWithTitle:str iconName:@""];
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
                                                                 action:@selector(addDevice)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)addDevice
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
    static NSString *cellIdentifier = @"SHSceneTableViewCell";
    SHSceneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSceneTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    SHSceneModel *model = self.models[indexPath.row];
    cell.model = model;
    
    return cell;
}


@end
