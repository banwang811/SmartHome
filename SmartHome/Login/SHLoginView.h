//
//  SHLoginView.h
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHLoginView : UIView

@property (nonatomic, strong) void(^loginBlock)();

@property (nonatomic, strong) void(^registerBlock)();

@property (nonatomic, strong) void(^forgetBlock)();

@end
