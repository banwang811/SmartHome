//
//  SHDataManager.m
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHDataManager.h"

@implementation SHDataManager

+ (SHDataManager *)shareManager
{
    static SHDataManager *shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[SHDataManager alloc] init];
    });
    return shareManager;
}


- (void)prepareDB
{
    NSString *directoryPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/SHData"]];
    if (![[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:NO])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/SHData/my.db"]];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbPath])
    {
        [[NSFileManager defaultManager] createFileAtPath:dbPath contents:nil attributes:nil];
    }
    NSLog(@"%@",dbPath);
    [[NSMeapDB shareMeap] initDBPath:dbPath];
}

@end
