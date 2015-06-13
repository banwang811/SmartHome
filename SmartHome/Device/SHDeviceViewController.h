//
//  SHDeviceViewController.h
//  SmartHome
//
//  Created by banwang on 15/6/8.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHBaseViewController.h"

typedef enum {
    
    SHDeviceViewController_common,
    SHDeviceViewController_combination,
    SHDeviceViewController_select,
    
}SHDeviceViewController_type;

@interface SHDeviceViewController : SHBaseViewController

- (id)initWithType:(SHDeviceViewController_type)type;

@end
