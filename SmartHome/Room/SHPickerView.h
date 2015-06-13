//
//  SHPickerView.h
//  SmartHome
//
//  Created by banwang on 15/6/11.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHPickerView : UIView

@property (nonatomic, strong) id<UIPickerViewDataSource>  dataSource;

@property (nonatomic, strong) id<UIPickerViewDelegate>      delegate;

@property (nonatomic, copy) void (^sureButtonClickBlock)();

@property (nonatomic, copy) void (^cancelButtonClickBlock)();


@end
