//
//  SHAccountManager.m
//  SmartHome
//
//  Created by banwang on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHAccountManager.h"

@implementation SHAccountManager

+ (SHAccountManager *)shareManager{
    static SHAccountManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[SHAccountManager alloc] init];
    });
    return shareManager;
}

@end
