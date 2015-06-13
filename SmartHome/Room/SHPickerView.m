//
//  SHPickerView.m
//  SmartHome
//
//  Created by banwang on 15/6/11.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHPickerView.h"

@interface SHPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView          *pickerView;

@property (nonatomic, strong) UIView                *toolBar;
@property (nonatomic, strong) UIButton              *cancleButton;
@property (nonatomic, strong) UIButton              *sureButton;

@end

@implementation SHPickerView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView
{
    self.backgroundColor = [UIColor grayColor];
    self.toolBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 44)];
    [self addSubview:self.toolBar];
    
    self.cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancleButton.frame = CGRectMake(20, 2, 40, 40);
    [self.cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancleButton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBar addSubview:self.cancleButton];

    self.sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureButton.frame = CGRectMake(self.frame.size.width - 40 -20, 2, 40, 40);
    [self.sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBar addSubview:self.sureButton];

    
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0,44, self.frame.size.width, self.frame.size.height - 44)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.pickerView];
}


#pragma mark - pickerViewDelegate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return [_dataSource numberOfComponentsInPickerView:pickerView];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_dataSource pickerView:pickerView numberOfRowsInComponent:component];
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_delegate pickerView:pickerView titleForRow:row forComponent:component];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return [_delegate pickerView:pickerView rowHeightForComponent:component];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [_delegate pickerView:pickerView didSelectRow:row inComponent:component];
}


- (void)cancleButtonClick
{
    if (self.cancelButtonClickBlock)
    {
        self.cancelButtonClickBlock();
    }
}

- (void)sureButtonClick
{
    if (self.sureButtonClickBlock)
    {
        self.sureButtonClickBlock();
    }
}

@end
