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

@interface LeftSideBarViewController ()
{
    NSArray     *_dataList;
    NSInteger   _selectIdnex;
}

@property (nonatomic, strong) UITableView       *tableview;

@end

@implementation LeftSideBarViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    _dataList = @[@"首页",@"房间",@"场景",@"设备",@"消息",@"设置"];
    if ([_delegate respondsToSelector:@selector(leftSideBarSelectWithController:)]) {
        [_delegate leftSideBarSelectWithController:[self subConWithIndex:0]];
        _selectIdnex = 0;
    }
}


- (UITableView *)tableview
{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate = self;
    }
    return _tableview;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    cell.textLabel.text = [_dataList objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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

- (UINavigationController *)subConWithIndex:(NSInteger)index
{
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
