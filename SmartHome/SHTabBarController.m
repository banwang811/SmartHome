//
//  SHTabBarController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTabBarController.h"

#import "SHHomeViewController.h"
#import "SHMessageViewController.h"
#import "SHSetingViewController.h"
#import "SHNavigationController.h"

@interface SHTabBarController ()

@end

@implementation SHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    [self setupTabBar];
    [self setupSubViewController];
}

- (void)setupTabBar
{
    self.tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49)];
    self.tabBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tabBarView];
}

- (void)setupSubViewController
{
    // add sub viewController
    SHHomeViewController *hVC = [[SHHomeViewController alloc] init];
    [self addSubViewController:hVC title:@"Home" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_highlighted"];
    
    SHMessageViewController *mVC = [[SHMessageViewController alloc] init];
    [self addSubViewController:mVC title:@"Messages" imageName:@"tabbar_messages" selectedImageName:@"tabbar_messages_highlighted"];
    
    SHSetingViewController *sVC = [[SHSetingViewController alloc] init];
    [self addSubViewController:sVC title:@"Settings" imageName:@"tabbar_settings" selectedImageName:@"tabbar_settings_highlighted"];
}

- (void)addSubViewController:(UIViewController *)subVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    NSMutableDictionary *selectedtextAttrs = [NSMutableDictionary dictionary];
    selectedtextAttrs[NSForegroundColorAttributeName] = [UIColor themeColor];
    [subVC.tabBarItem setTitleTextAttributes:selectedtextAttrs forState:UIControlStateSelected];
    subVC.view.backgroundColor = [UIColor whiteColor];
    subVC.tabBarItem.image = [UIImage imageNamed:imageName];
    subVC.title = title;
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    if (IOS_7_OR_LATER) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAutomatic];
    }
    subVC.tabBarItem.selectedImage = selectedImage;
    
    SHNavigationController *navVC = [[SHNavigationController alloc] initWithRootViewController:subVC];
    
    [self addChildViewController:navVC];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
