//
//  SHAdapter.h
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHAdapter : NSObject

@property (nonatomic, assign) BOOL      isIphone4s;
@property (nonatomic, assign) BOOL      isIphone5s;
@property (nonatomic, assign) BOOL      isIphone6;
@property (nonatomic, assign) BOOL      isIphone6P;

+ (SHAdapter *)shareAdapter;

@end
