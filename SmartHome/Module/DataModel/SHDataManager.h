//
//  SHDataManager.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDataManager : NSObject

+ (SHDataManager *)shareManager;

- (void)prepareDB;

@end
