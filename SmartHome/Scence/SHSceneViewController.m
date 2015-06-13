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
#import "SHSceneSetingController.h"


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
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)reloadData
{
    NSArray *sceneModels= [NSSceneModel fetchScenes];
    [self.models removeAllObjects];
    for (NSSceneModel *model in sceneModels)
    {
        SHSceneModel *cellModel = [[SHSceneModel alloc] init];
        cellModel.title = model.sceneName;
        cellModel.iconName = model.sceneIcon;
        cellModel.Id = model.sceneID;
        [self.models addObject:cellModel];
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
    SHSceneSetingController *controller = [[SHSceneSetingController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
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
