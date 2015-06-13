//
//  SHChangePasswordView.h
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHChangePasswordView : UIView

@property (nonatomic, copy) void(^changeBlcok)(BOOL success, SHError *error);

@end
