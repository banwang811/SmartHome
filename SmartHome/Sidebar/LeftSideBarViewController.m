//
//  LeftNavViewController.m
//  SideBarNavDemo
//
//  Created by JianYe on 12-12-11.
//  Copyright (c) 2012年 JianYe. All rights reserved.
//

#import "LeftSideBarViewController.h"
#import "SideBarSelectedDelegate.h"
#import "SidebarViewController.h"
#import "SHHomeViewController.h"
#import "SHRoomViewController.h"
#import "SHSceneViewController.h"
#import "SHSetingViewController.h"
#import "SHMessageViewController.h"
#import "SHDeviceViewController.h"
#import "SHSideModel.h"
#import "SHSideTableViewCell.h"

@interface LeftSideBarViewController ()
{
    NSArray     *_dataList;
    NSInteger   _selectIdnex;
}

@property (nonatomic, strong) UITableView       *tableview;

@property (nonatomic, strong) NSMutableArray    *dataArray;

@property (nonatomic, strong) UIButton          *loginButton;

@property (nonatomic, strong) UIButton          *registerButton;

@end

@implementation LeftSideBarViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (instancetype)init{
    if (self = [super init]) {
        _dataList = @[@"首页",@"房间",@"场景",@"设备",@"消息",@"设置"];
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    
//    [self.view addSubview:self.loginButton];
//    [self.view addSubview:self.registerButton];

    if ([_delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [_delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        _selectIdnex = 0;
    }
    for (int i = 0; i < [_dataList count]; i++) {
        NSString *iconName = [NSString stringWithFormat:@"menuItem%d",i+1];
        SHSideModel *model = [SHSideModel itemWithTitle:[_dataList objectAtIndex:i] iconName:iconName];
        [self.dataArray addObject:model];
    }
}

/*
- (UIButton *)loginButton{
    if (_loginButton == nil) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(0, 0, 100, 40);
        _loginButton.backgroundColor = [UIColor redColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchDragInside];
    }
    return _loginButton;
}

- (UIButton *)registerButton{
    if (_registerButton == nil) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.frame = CGRectMake(140, 0, 100, 40);
        _registerButton.backgroundColor = [UIColor blueColor];

        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchDragInside];

    }
    return _registerButton;
}

- (void)loginButtonClick{

}

- (void)registerButtonClick{
    
}

*/

- (UITableView *)tableview{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"SHSideTableViewCell";
    SHSideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHSideTableViewCell" owner:self options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    SHSideModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([_delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        if (indexPath.row == _selectIdnex) {
            [_delegate leftSideBarSelectWithController:nil];
        }else
        {
            [_delegate leftSideBarSelectWithController:[self subConWithIndex:indexPath.row]];
        }
        
    }
    _selectIdnex = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UINavigationController *)subConWithIndex:(NSInteger)index{
    UIViewController *controller = nil;
    switch (index) {
        case 0:
            controller = [SHHomeViewController new];
            break;
        case 1:
            controller = [SHRoomViewController new];
            break;
        case 2:
            controller = [SHSceneViewController new];
            break;
        case 3:
            controller = [SHDeviceViewController new];
            break;
        case 4:
            controller = [SHMessageViewController new];
            break;
        case 5:
            controller = [SHSetingViewController new];
            break;
            
        default:
            break;
    }
    controller.title = [_dataList objectAtIndex:index];
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:controller];
    nav.navigationBar.hidden = NO;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"打开"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addDevice)];
    controller.navigationItem.leftBarButtonItem = rightItem;
    return nav ;
}

- (void)addDevice{
    [[SidebarViewController share] showSideBarControllerWithDirection];
}

@end
