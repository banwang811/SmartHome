//
//  SHContentView.h
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SHContentViewDelegate <NSObject>

- (void)panContentView;

- (void)restoreContentView;

@end

@interface SHContentView : UIView

@property (nonatomic, assign) id<SHContentViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame parentView:(UIView *)parentView;

@end
