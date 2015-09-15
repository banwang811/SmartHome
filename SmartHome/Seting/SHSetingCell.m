//
//  SHSetingCell.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSetingCell.h"

@interface SHSetingCell ()

@property (weak, nonatomic) IBOutlet UILabel            *nameLabel;

@property (nonatomic, strong) UILabel                   *line;

@end

@implementation SHSetingCell

- (void)setModel:(SHSetingModel *)model
{
    if (self.line == nil) {
        self.line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, SCREEN_WIDTH, 0.5)];
        self.line.backgroundColor = [UIColor  shlightGrayColor];
        [self addSubview:self.line];
    }
    self.nameLabel.text = model.title;
    _model = model;
}


@end
