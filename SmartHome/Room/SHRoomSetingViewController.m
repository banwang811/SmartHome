//
//  SHRoomSetingViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomSetingViewController.h"
#import "SHRoomSetingModel.h"
#import "SHRootSetingViewCell.h"
#import "SHPickerView.h"
#import "SHDeviceViewController.h"


@interface SHRoomSetingViewController()<UITableViewDataSource,
                                        UITableViewDelegate,
                                        UIPickerViewDataSource,
                                        UIPickerViewDelegate,
                                        UITextFieldDelegate>

@property (nonatomic, strong) UITableView           *tableView;

@property (nonatomic, strong) NSMutableArray        *models;

@property (nonatomic ,strong) NSArray               *pickerArray;

@property (nonatomic, strong) SHPickerView          *pickerView;

@property (nonatomic, strong) SHRootSetingViewCell   *cell;

@property (nonatomic, strong) UIView                *tableFootView;

@property (nonatomic, strong) UIButton              *saveButton;

@property (nonatomic, assign) SHSetingViewType      controlerType;

@end

@implementation SHRoomSetingViewController

- (id)initWithType:(SHSetingViewType)type
{
    if (self = [super init])
    {
        self.controlerType = type;
        self.models = [NSMutableArray array];
        self.pickerArray = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupContentView];
    [self reloadData];
    [self setContentView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.controlerType == SHSetingViewType_scene) {
        self.title = @"添加场景";
    }else{
        self.title = @"添加房间";
    }
}


- (void)reloadData{
    
}

- (void)setupContentView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tableView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.tableView];
    
    
    self.tableFootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.tableView.tableFooterView = self.tableFootView;
    
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (self.controlerType == SHSetingViewType_scene) {
        [self.saveButton setTitle:@"保存场景" forState:UIControlStateNormal];
    }else{
        [self.saveButton setTitle:@"保存房间" forState:UIControlStateNormal];
    }
    self.saveButton.frame = CGRectMake(10, 50, self.view.frame.size.width - 20, 44);
    self.saveButton.backgroundColor = [UIColor redColor];
    [self.saveButton addTarget:self action:@selector(saveRoomSetting) forControlEvents:UIControlEventTouchUpInside];
    [self.tableFootView addSubview:self.saveButton];
    
}

- (void)setContentView
{    
    self.pickerView = [[SHPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 216)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    __weak SHRoomSetingViewController * wealSelf = self;
    self.pickerView.sureButtonClickBlock = ^{
        [UIView animateWithDuration:0.5 animations:^{
            wealSelf.pickerView.frame = CGRectMake(0, wealSelf.view.frame.size.height, wealSelf.view.frame.size.width, 216);
        }];
    };
    self.pickerView.cancelButtonClickBlock = ^{
        [UIView animateWithDuration:0.5 animations:^{
            wealSelf.pickerView.frame = CGRectMake(0, wealSelf.view.frame.size.height, wealSelf.view.frame.size.width, 216);
        }];
    };
    [self.view addSubview:self.pickerView];
}

#pragma mark - pickerViewDelegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerArray count];
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerArray objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self.cell selectIcon:@"eeeee" imageName:@""];
}


#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 100;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *cellIdentifier = @"SHRootSetingViewCell";
        SHRootSetingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [SHRootSetingViewCell creatBaseInfoCell];
        }
        __weak SHRoomSetingViewController * wealSelf = self;
        cell.selectButtonClick = ^{
            [UIView animateWithDuration:0.5 animations:^{
                wealSelf.pickerView.frame = CGRectMake(0, wealSelf.view.frame.size.height - 216, wealSelf.view.frame.size.width, 216);
            }];
        };
        self.cell = cell;
        if (self.controlerType == SHSetingViewType_room) {
            cell.nameLabel.text = @"房间名称";
        }else
        {
            cell.nameLabel.text = @"场景名称";
        }
        return cell;
    }else
    {
        static NSString *cellIdentifier = @"SHRootSetingViewDevice";
        SHRootSetingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [SHRootSetingViewCell creatAddDeviceCell];
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"开发中"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
    return;
    if (indexPath.section == 1) {
        SHDeviceViewController *controller = [[SHDeviceViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"基本信息设置";
    }
    return @"添加设备";
}


- (void)saveRoomSetting
{
    if (self.controlerType == SHSetingViewType_scene) {
        int i = rand()%100000;
        NSSceneModel *model = [[NSSceneModel alloc] init];
        model.sceneID = [NSString stringWithFormat:@"%d",i];
        model.sceneIcon = [NSString stringWithFormat:@"image%d",i];
        model.sceneName = [NSString stringWithFormat:@"场景%d",i];
        [model saveDB];
    }else
    {
        int i = rand()%100000;
        NSRoomModel *model = [[NSRoomModel alloc] init];
        model.roomID = [NSString stringWithFormat:@"%d",i];
        model.roomIcon = [NSString stringWithFormat:@"image%d",i];
        model.roomName = [NSString stringWithFormat:@"房间%d",i];
        [model saveDB];
    }
}

@end
