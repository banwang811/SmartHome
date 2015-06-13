//
//  SHAdapter.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHAdapter.h"

@implementation SHAdapter

+ (SHAdapter *)shareAdapter
{
    static SHAdapter *shareAdapter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareAdapter = [[SHAdapter alloc] init];
    });
    return shareAdapter;
}

- (id)init
{
    if (self = [super init]) {
        [self adapterDevice];
    }
    return self;
}

- (void)adapterDevice
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (height == 480) {
        self.isIphone4s = YES;
    }else if(height == 568){
        self.isIphone5s = YES;
    }else if (height == 667){
        self.isIphone6 = YES;
    }else if (height == 736){
        self.isIphone6P = YES;
    }
}

@end
