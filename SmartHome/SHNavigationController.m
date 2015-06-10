//
//  SHNavigationController.m
//  SmartHome
//
//  Created by banwang on 15/6/1.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHNavigationController.h"

@interface SHNavigationController ()

@end

@implementation SHNavigationController

// this method will be call when first time call this class
+ (void)initialize
{
    [self setupNavigationBarTheme];
    [self setupBarButtonItemTheme];
}

#pragma mark - setup theme

// setup UINavigationBar theme
+ (void)setupNavigationBarTheme
{
    // it can setup all project's navigationbar by setting appearance
    UINavigationBar *appearance = [UINavigationBar appearance];
    // set text attribute
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor themeColor];
    
    [appearance setTitleTextAttributes:textAttrs];
}

// setup  UIBarButtonItem theme
+ (void)setupBarButtonItemTheme
{
    // it can setup all project's navigationbar by setting appearance
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    // set text attributes
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor themeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // set high lighted text attributes
    NSMutableDictionary *highLightedTextAttrs = [NSMutableDictionary dictionary];
    highLightedTextAttrs[NSForegroundColorAttributeName] = [UIColor defaultColor];
    [appearance setTitleTextAttributes:highLightedTextAttrs forState:UIControlStateHighlighted];
    
    // set disable text attributes
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
}

- (void)setNavigationBarTheme
{
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor themeColor];
    [self.navigationBar setTitleTextAttributes:textAttrs];
}

- (void)setBarButtonItemTheme
{
    // it can setup all project's navigationbar by setting appearance
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    // set text attributes
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor themeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarTheme];
    [self setBarButtonItemTheme];
}

#pragma mark - rewrite mothod

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

- (void)back
{
#warning here use self, because self is current navigation controller which is using.
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
