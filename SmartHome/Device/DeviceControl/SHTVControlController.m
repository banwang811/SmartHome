//
//  SHTVControlController.m
//  SmartHome
//
//  Created by banwang on 15/6/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTVControlController.h"
#import "SHTVControlView.h"

@interface SHTVControlController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView               *tableView;

@property (nonatomic, strong) SHTVControlView           *controlView;

@end

@implementation SHTVControlController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupContentView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = @"电视遥控器";
}

- (void)setupContentView
{
    self.controlView = [[SHTVControlView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    
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
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SHTVControlCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.contentView addSubview:self.controlView];

    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
