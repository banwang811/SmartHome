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
#import "APService.h"

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
    self.window.rootViewController = [[SHNavigationController alloc] initWithRootViewController:self.loginController];
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor,
                          [UIFont systemFontOfSize:18],UITextAttributeFont, nil];
    [UINavigationBar appearance].titleTextAttributes = dict;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];    
    [UINavigationBar appearance].translucent  = NO;
    [UINavigationBar appearance].barTintColor = [UIColor navagationBarColor];
    [self.window makeKeyAndVisible];
    //极光注册
    [self registerJGPush:launchOptions];
    return YES;
}

- (void)registerJGPush:(NSDictionary *)launchOptions{
    // Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                       UIUserNotificationTypeSound |
                                                       UIUserNotificationTypeAlert)
                                           categories:nil];
    } else {
        //categories 必须为nil
        [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil];
    }
    // Required
    [APService setupWithOption:launchOptions];
}

- (SidebarViewController *)mainController{
    if (_mainController == nil) {
        _mainController = [[SidebarViewController alloc] init];
    }
    return _mainController;
}

- (SHLoginController *)loginController{
    if (_loginController == nil) {
        _loginController = [[SHLoginController alloc] init];
    }
    return _loginController;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // IOS 7 Support Required
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
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
