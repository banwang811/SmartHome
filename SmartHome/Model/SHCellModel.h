//
//  SHCellModel.h
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCellModel : NSObject

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *Id;

+ (instancetype)itemWithTitle:(NSString *)title iconName:(NSString *)iconName;
+ (instancetype)itemWithTitle:(NSString *)title;


@end
