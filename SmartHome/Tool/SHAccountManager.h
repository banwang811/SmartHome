//
//  SHAccountManager.h
//  SmartHome
//
//  Created by banwang on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAccountManager : NSObject

@property (nonatomic, strong) NSString      *account;

@property (nonatomic, strong) NSString      *password;

+ (SHAccountManager *)shareManager;

@end
