//
//  NSDataBaseMethod.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSDataBaseMethod <NSObject>

@optional

/**
 *  读取数据库 更新本地数据
 */
+ (void)reloadDB;

/**
 *  将对象保存到数据库
 */
- (void)saveDB;

/**
 *  更新数据库对象
 */
- (void)uploadDB;

/**
 *  从数据库删除对象
 */
- (void)deleteDB;

+ (void)saveDB:(NSArray *)objects;

+ (void)updateDB:(NSArray *)objects;

@end
