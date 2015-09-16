//
//  SHFeedBackController.m
//  SmartHome
//
//  Created by mac on 15/9/15.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHFeedBackController.h"
#import "HPGrowingTextView.h"

@interface SHFeedBackController ()<HPGrowingTextViewDelegate>

@property (nonatomic, strong) HPGrowingTextView                 *textView;

@property (nonatomic, strong) UIButton                          *commitButton;

@end

@implementation SHFeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    [self.view addSubview:self.textView];
    [self.view addSubview:self.commitButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (HPGrowingTextView *)textView{
    if (_textView == nil) {
        _textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH - 20, 200)];
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.layer.backgroundColor = [[UIColor clearColor] CGColor];
        _textView.layer.borderColor = [[UIColor shlightGrayColor]CGColor];
        _textView.layer.borderWidth = 1.0;
        _textView.layer.cornerRadius = 4.0f;
        _textView.placeholder = @"感谢你对我们的支持，您的建议是我们前进的动力！";
        _textView.isScrollable = NO;
        _textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
        
        _textView.minNumberOfLines = 8;
        _textView.maxNumberOfLines = 9;
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeySend;
        [_textView.layer setMasksToBounds:YES];
    }
    return _textView;
}


- (UIButton *)commitButton{
    if (_commitButton == nil) {
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commitButton.frame = CGRectMake(10, 200, SCREEN_WIDTH - 20, 40);
        _commitButton.layer.cornerRadius = 5;
        _commitButton.backgroundColor = [UIColor navagationBarColor];
        [_commitButton setTitle:@"提交" forState:UIControlStateNormal];
        [_commitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commitButton;
}

- (void)commitButtonClick{
    
}


#pragma mark - HPGrowingTextViewDelegate
- (void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView{
    NSCharacterSet *whiltSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *textStr = [growingTextView.text stringByTrimmingCharactersInSet:whiltSpace];
    if (textStr == nil || [textStr isEqualToString:@""] || textStr.length == 0){
        return ;
    }
}


- (BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"%@",growingTextView.text);
    if ([@"\n" isEqualToString:text]){
        //
        NSCharacterSet *whiltSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *textStr = [growingTextView.text stringByTrimmingCharactersInSet:whiltSpace];
        if (textStr == nil || [textStr isEqualToString:@""] || textStr.length == 0)
        {
            return NO;
        }
        return YES;
    }
    return YES;
}




@end
