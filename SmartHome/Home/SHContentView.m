//
//  SHContentView.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHContentView.h"

#define OPENCENTERX 220.0
#define DIVIDWIDTH 70.0 //OPENCENTERX 对应确认是否打开或关闭的分界线。

@interface SHContentView()
{
    CGPoint openPointCenter;
    CGPoint closePointCenter;
}

@property (nonatomic, strong)  UIView  *parentView;

@end

@implementation SHContentView

- (id)initWithFrame:(CGRect)frame parentView:(UIView *)parentView
{
    if (self = [super initWithFrame:frame]) {
        _parentView = parentView;
        [self addGestureRecognizer];
    }
    return self;
}


- (void)addGestureRecognizer
{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(handlePan:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(handleTap:)];
    
    [self addGestureRecognizer:tapGestureRecognizer];
    openPointCenter = CGPointMake(_parentView.center.x + OPENCENTERX,
                                  _parentView.center.y);
}

-(void) handlePan:(UIPanGestureRecognizer*) recognizer
{
    CGPoint translation = [recognizer translationInView:self.parentView];
    
    float x = self.center.x + translation.x;
    if (x < self.parentView.center.x) {
        x = self.parentView.center.x;
    }
    SHAPP_DELEGATE.tabBarController.tabBarView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);

    self.center = CGPointMake(x, openPointCenter.y);
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.75
                              delay:0.01
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^(void)
        {

             if (x > openPointCenter.x -  DIVIDWIDTH) {
                 self.center = openPointCenter;
             }else{
                 self.center = CGPointMake(openPointCenter.x - OPENCENTERX,
                                           openPointCenter.y);
             }
         }completion:nil];
    }
    
    [recognizer setTranslation:CGPointZero inView:self.parentView];
}

-(void) handleTap:(UITapGestureRecognizer*) recognizer
{
    [UIView animateWithDuration:0.75
                          delay:0.01
                        options:UIViewAnimationOptionTransitionCurlUp
                     animations:^(void){
                            self.center = CGPointMake(openPointCenter.x - OPENCENTERX,
                                                      openPointCenter.y);
                        }completion:nil];
    
}


@end
