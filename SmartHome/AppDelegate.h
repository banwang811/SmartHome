//
//  AppDelegate.h
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHTabBarController.h"
#import "SidebarViewController.h"
#import "SHLoginController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong)SidebarViewController   *mainController;

@property (nonatomic, strong)SHLoginController       *loginController;

@property (nonatomic, strong)NSDictionary            *imageDict;

@end

