//
//  SHAddDeviceViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHAddDeviceViewController.h"
#import "SHAddCell.h"
#import "SHAddModel.h"
#import "SHManuallyAddController.h"
#import "SHScanViewController.h"

@interface SHAddDeviceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;


@end

@implementation SHAddDeviceViewController

- (id)init
{
    if (self = [super init]) {
        [self reloadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"添加方式";
    [self reloadData];
}

- (void)reloadData{
    SHAddModel *model = [SHAddModel itemWithTitle:@"扫描" iconName:@""];
    SHAddModel *model2 = [SHAddModel itemWithTitle:@"手动输入" iconName:@""];
    self.models  = [NSMutableArray arrayWithObjects:model,model2, nil];
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}


#pragma mark - tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"SHAddCell";
    SHAddCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHAddCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = [self.models objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        SHScanViewController *controller = [[SHScanViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        SHManuallyAddController *controller = [[SHManuallyAddController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
