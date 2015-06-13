//
//  SHTVControlView.m
//  SmartHome
//
//  Created by banwang on 15/6/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTVControlView.h"

#define width1 60
#define height1 40

#define width2 90
#define height2 65

#define width3 65
#define height3 65

#define originX 20
#define originX2 45

#define speace1 10
#define speace2 1
#define speace3 100

@interface SHTVControlView ()


@end

@implementation SHTVControlView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupContentView];
    }
    return self;
}

- (void)setupContentView
{
    CGFloat originY = 0;
    if ([SHAdapter shareAdapter].isIphone4s){
        originY = 20;
    }else{
        originY = 40;
    }
    NSArray *arry = [[NSArray alloc] initWithObjects:@"TVAVBtnImage.png",@"MODEBtnImage.png",@"MUTEBtnImage.png",@"ONOFFBtnImage.png",nil];
    CGFloat origin1 = (self.frame.size.width - 4 * width1 - speace1 *3)/2;
    for (int i = 0; i<4; i++) {
        UIButton *UpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UpBtn.frame = CGRectMake(origin1 + i *(width1 + speace1), originY, width1, height1);
        UpBtn.tag = 10001 + i;
        UpBtn.adjustsImageWhenHighlighted = YES;
        [UpBtn setImage:[UIImage imageNamed:[arry objectAtIndex:i]] forState:UIControlStateNormal];
        [UpBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:UpBtn];
    }
    
    NSArray *arryNum = [[NSArray alloc] initWithObjects:@"1BtnImage.png",@"2BtnImage.png",@"3BtnImage.png",@"4BtnImage.png",@"5BtnImage.png",@"6BtnImage.png",@"7BtnImage.png",@"8BtnImage.png",@"9BtnImage.png",@"USER1BtnImage.png",@"0BtnImage.png",@"USER2BtnImage.png",nil];
    CGFloat origin2 = (self.frame.size.width - 3 * width2 - speace2 *3)/2;
    for (int i = 0; i<4; i++) {//行
        for (int j = 0; j<3; j++) {//列
            UIButton *UpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            UpBtn.frame = CGRectMake(origin2 + j * (width2 + speace2), (originY +60) + i * height1, width2, height1);
            UpBtn.tag = 10005 + i * 3+j;
            UpBtn.adjustsImageWhenHighlighted = YES;
            [UpBtn setImage:[UIImage imageNamed:[arryNum objectAtIndex:i * 3+j]] forState:UIControlStateNormal];
            [UpBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:UpBtn];
            
        }
    }
    
    NSArray *arryCha = [[NSArray alloc] initWithObjects:@"PLUSBtnImage.png",@"UPBtnImage.png",@"SUBBtnImage.png",@"DOWNBtn.png",nil];
    CGFloat origin3 = (self.frame.size.width - 2 * width3 - speace3)/2;
    for (int i = 0; i<2; i++) {
        for (int j = 0; j<2; j++) {
            UIButton *TempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            TempBtn.frame = CGRectMake(origin3 + j * (width3 + speace3), (originY + 40)+200 + i * 88, width3, height3);
            TempBtn.tag = 10020 + i * 2+j;
            TempBtn.adjustsImageWhenHighlighted = YES;
            [TempBtn setImage:[UIImage imageNamed:[arryCha objectAtIndex:i*2+j]] forState:UIControlStateNormal];
            [TempBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:TempBtn];
        }
    }
    
    UIButton *TempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat origin4 = (self.frame.size.width - 45)/2;
    TempBtn.frame = CGRectMake(origin4 , 300 + originY, 50, 45);
    TempBtn.tag = 10030;
    TempBtn.adjustsImageWhenHighlighted = YES;
    [TempBtn setImage:[UIImage imageNamed:@"BACKBtnImage.png"] forState:UIControlStateNormal];
    [TempBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:TempBtn];
}

- (void)btnClick:(UIButton *)button
{
    
}

@end
