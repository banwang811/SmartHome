//
//  SHSetingViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSetingViewController.h"
#import "SHSetingCell.h"
#import "SHSetingModel.h"
#import "SHChangePasswordController.h"

@interface SHSetingViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;


@end

@implementation SHSetingViewController

- (id)init
{
    if (self = [super init]) {
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
    [self.models removeAllObjects];
    SHSetingModel *model1 = [SHSetingModel itemWithTitle:@"意见反馈" iconName:@""];
    SHSetingModel *model2 = [SHSetingModel itemWithTitle:@"修改密码" iconName:@""];
    SHSetingModel *model3 = [SHSetingModel itemWithTitle:@"修改密码" iconName:@""];
    SHSetingModel *model4 = [SHSetingModel itemWithTitle:@"版本更新" iconName:@""];
    SHSetingModel *model5 = [SHSetingModel itemWithTitle:@"联系我们" iconName:@""];
    self.models = [NSMutableArray arrayWithObjects:model1,model2,model3,model4,model5, nil];
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
    static NSString *cellIdentifier = @"SHSetingCell";
    SHSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSetingCell" owner:self options:nil] objectAtIndex:0];
    }
    
    SHSetingModel *model = self.models[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        SHChangePasswordController *controller = [[SHChangePasswordController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else
    {
        UIViewController *controller = [[UIViewController alloc] init];
        SHSetingModel *model = self.models[indexPath.row];
        controller.title = model.title;
        [self.navigationController pushViewController:controller animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
