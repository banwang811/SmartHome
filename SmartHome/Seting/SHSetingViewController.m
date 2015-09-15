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

@property (nonatomic, strong) UIButton                  *logout;

@property (nonatomic, strong) UIView                    *footView;


@end

@implementation SHSetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self reloadData];
}


- (void)reloadData{
    [self.models removeAllObjects];
    SHSetingModel *model1 = [SHSetingModel itemWithTitle:@"意见反馈" iconName:@""];
    SHSetingModel *model2 = [SHSetingModel itemWithTitle:@"我要评价" iconName:@""];
    SHSetingModel *model3 = [SHSetingModel itemWithTitle:@"修改密码" iconName:@""];
    SHSetingModel *model4 = [SHSetingModel itemWithTitle:@"版本更新" iconName:@""];
    SHSetingModel *model5 = [SHSetingModel itemWithTitle:@"关于我们" iconName:@""];
    self.models = [NSMutableArray arrayWithObjects:model1,model2,model3,model4,model5, nil];
    [self.tableView reloadData];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = self.footView;
    }
    return _tableView;
}

- (UIView *)footView{
    if (_footView == nil) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        [_footView addSubview:self.logout];
    }
    return _footView;
}

- (UIButton *)logout{
    if (_logout == nil) {
        _logout = [UIButton buttonWithType:UIButtonTypeCustom];
        _logout.frame = CGRectMake(0, 40, SCREEN_WIDTH, 40);
        _logout.backgroundColor = [UIColor whiteColor];
        [_logout setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logout setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logout;
}

- (void)logoutClick{
    SHAPP_DELEGATE.window.rootViewController = SHAPP_DELEGATE.loginController;
}


#pragma mark - tableviewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"SHSetingCell";
    SHSetingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSetingCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    SHSetingModel *model = self.models[indexPath.row + indexPath.section *2];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1){
        SHChangePasswordController *controller = [[SHChangePasswordController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else{
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
