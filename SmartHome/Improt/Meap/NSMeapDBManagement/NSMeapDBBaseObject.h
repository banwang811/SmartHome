//
//  NSMeapDBBaseObject.h
//  NSMeap
//
//  Created by 十九 on 13-9-9.
//  Copyright (c) 2013年 nationsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDataBaseMethod.h"
/// 本地数据库Sqlit创建表的基本对象类
@interface NSMeapDBBaseObject : NSObject<NSDataBaseMethod>

/// 数据id
@property (nonatomic,assign) long meap_id;

@end
