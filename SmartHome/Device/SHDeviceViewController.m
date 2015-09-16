//
//  SHDeviceViewController.m
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHDeviceViewController.h"
#import "SHAddDeviceViewController.h"
#import "SHSelectViewController.h"
//common
#import "SHDeviceCell.h"
#import "SHPickerView.h"
//other
#import "SHTVControlController.h"
#import "SHAirconditionController.h"


@interface SHDeviceViewController ()<UITableViewDataSource,
                                    UITableViewDelegate,
                                    UIPickerViewDataSource,
                                    UIPickerViewDelegate,
                                    UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray            *models;

@property (nonatomic, strong) UITableView               *tableView;

@property (nonatomic, strong) SHPickerView              *pickerView;

@property (nonatomic, strong) NSArray                   *pickerArray;

@property (nonatomic, assign) CGFloat                   contentOffY;

@property (nonatomic, strong) NSIndexPath               *indexPath;

@property (nonatomic, assign) NSString                  *selectDeviceID;

@property (nonatomic, assign) NSDeviceModelState        deviceState;

@property (nonatomic, assign) SHDeviceViewController_type controllerType;

@property (nonatomic, strong) NSMutableArray            *titleArray;

@end

@implementation SHDeviceViewController
/*
NSDeviceModelType_Light,//普通灯
NSDeviceModelType_DimmingLight,//调光灯
NSDeviceModelType_TV,//电视
NSDeviceModelType_Aircondition,//空调
NSDeviceModelType_Socket,//智能插座
NSDeviceModelType_Curtain,//窗帘
NSDeviceModelType_FloorHeating,//地暖
NSDeviceModelType_OpenStaircase,//开窗器
NSDeviceModelType_THTB,//温湿度传感器
NSDeviceModelType_Camera,//摄像头控制
*/
- (id)initWithType:(SHDeviceViewController_type)type
{
    if (self = [super init]) {
        self.models = [NSMutableArray array];
        self.pickerArray = [NSArray arrayWithObjects:@"打开",@"关闭", nil];
        self.controllerType = type;
        self.titleArray = [NSMutableArray arrayWithObjects:@"普通灯", @"调光灯",@"电视",@"空调",@"智能插座",@"窗帘",@"地暖",@"开窗器",@"温湿度传感器",@"摄像头控制",nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i= 0; i < 20; i ++)
    {
        NSInteger j = random() %10;
        NSDeviceModel *model = [[NSDeviceModel alloc] init];
        NSString *deviceName = [self.titleArray objectAtIndex:j];
        model.deviceName = deviceName;
        model.deviceID = [[NSString alloc] initWithFormat:@"设备%d",i];
        model.deviceType = (NSDeviceModelType)j;
        [model saveDB];
    }
    
    [self setupContentView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.controllerType == SHDeviceViewController_common) {
        self.title = @"设备";
    }else if(self.controllerType == SHDeviceViewController_combination){
        self.title = @"组合设备";
    }
    [self reloadData];
}

- (void)reloadData
{
//    NSArray *devices = [NSDeviceModel fetchDevices:nil];
//    [self.models removeAllObjects];
//    [self.models addObjectsFromArray:devices];
//    [self.tableView reloadData];
    
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://121.40.30.197/api/device" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        if (![dict isKindOfClass:[NSNull class]]) {
            NSArray *devices = [dict objectForKey:@"devices"];
            for (NSDictionary *deviceInfo in devices) {
                
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
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
    
    self.pickerView = [[SHPickerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, pickerViewHight)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    __weak SHDeviceViewController * wealSelf = self;
    self.pickerView.sureButtonClickBlock = ^{
        [UIView animateWithDuration:0.5 animations:^{
            wealSelf.tableView.contentOffset = CGPointMake(wealSelf.tableView.contentOffset.x,wealSelf.tableView.contentOffset.y - wealSelf.contentOffY);
            wealSelf.pickerView.frame = CGRectMake(0, wealSelf.view.frame.size.height, wealSelf.view.frame.size.width, pickerViewHight);
        }];
        //改变设备数据库数据
        NSArray *devices = [NSDeviceModel fetchDevices:wealSelf.selectDeviceID];
        NSDeviceModel *device = [devices objectAtIndex:0];
        device.deviceState = wealSelf.deviceState;
        [device uploadDB];
    };
    
    
    self.pickerView.cancelButtonClickBlock = ^{
        [UIView animateWithDuration:0.5 animations:^{
            wealSelf.pickerView.frame = CGRectMake(0, wealSelf.view.frame.size.height, wealSelf.view.frame.size.width, pickerViewHight);
        }];
    };
    [self.view addSubview:self.pickerView];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addDevice)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)addDevice
{
    if (self.controllerType == SHDeviceViewController_common) {
        //新的设备
        SHAddDeviceViewController   *controller = [[SHAddDeviceViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
        
    }else if(self.controllerType == SHDeviceViewController_combination){
        //选择设备
        SHSelectViewController *controller = [[SHSelectViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
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
    //改变cell
    SHDeviceCell *cell = (SHDeviceCell *)[self.tableView cellForRowAtIndexPath:self.indexPath];
    [cell changeDeviceState:[self.pickerArray objectAtIndex:row]];
    if (row == 0)
    {
        self.deviceState = NSDeviceModelState_On;
    }else
    {
        self.deviceState = NSDeviceModelState_Off;
    }
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
    static NSString *cellIdentifier = @"SHDeviceCell";
    SHDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SHDeviceCell" owner:self options:nil] objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDeviceModel *model = self.models[indexPath.row];
    cell.model = model;
    __weak SHDeviceViewController * weakSelf = self;
    cell.deleteDeviceClick = ^{
        weakSelf.selectDeviceID = model.deviceID;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"是否删除房间"
                                                       delegate:weakSelf
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"确定", nil];
        [alert show];
    };
    cell.controlStateClick = ^{
        weakSelf.indexPath = indexPath;
        weakSelf.selectDeviceID = model.deviceID;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.contentOffY = (indexPath.row +1) * 64 + pickerViewHight - weakSelf.tableView.contentOffset.y - weakSelf.view.frame.size.height;
            if (self.contentOffY >= 0)
            {
                weakSelf.tableView.contentOffset = CGPointMake(weakSelf.tableView.contentOffset.x,weakSelf.tableView.contentOffset.y + weakSelf.contentOffY);
            }
            else
            {
                weakSelf.contentOffY = 0;
            }
            weakSelf.pickerView.frame = CGRectMake(0, weakSelf.view.frame.size.height - pickerViewHight, weakSelf.view.frame.size.width, pickerViewHight);
        }];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = nil;
    NSDeviceModel *model = self.models[indexPath.row];
    switch (model.deviceType) {
        case NSDeviceModelType_Light:
            break;
        case NSDeviceModelType_DimmingLight:
            break;
        case NSDeviceModelType_TV:
            controller = [[SHTVControlController alloc] init];
            break;
        case NSDeviceModelType_Aircondition:
            controller = [[SHAirconditionController alloc] init];
            break;
        case NSDeviceModelType_Socket:
            break;
        case NSDeviceModelType_Curtain:
            break;
        case NSDeviceModelType_FloorHeating:
            break;
        case NSDeviceModelType_OpenStaircase:
            break;
        case NSDeviceModelType_THTB:
            break;
        case NSDeviceModelType_Camera:
            break;
        default:
            break;
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        return;
    }
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [NSDeviceModel deleteDevice:self.selectDeviceID];
        [self reloadData];
    }
}


@end
