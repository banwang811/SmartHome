//
//  AppDelegate.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "AppDelegate.h"
#import "SHLoginController.h"
#import "SHNavigationController.h"
#import "SHDataManager.h"
#import "SidebarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //背景色
    self.window.backgroundColor = [UIColor themeColor];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"IconImage" ofType:@"plist"];
    self.imageDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    //打开数据库文件
    [[SHDataManager shareManager] prepareDB];
    //登录
    self.window.rootViewController = [[SHNavigationController alloc] initWithRootViewController:[SHLoginController new]];
    
//    self.window.rootViewController =[SidebarViewController new];

    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,
                          [UIFont systemFontOfSize:18],UITextAttributeFont, nil];
    [UINavigationBar appearance].titleTextAttributes = dict;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];    
    [UINavigationBar appearance].translucent  = NO;
    [UINavigationBar appearance].barTintColor = [UIColor navagationBarColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
