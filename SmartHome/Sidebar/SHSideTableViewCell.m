//
//  SHSideTableViewCell.m
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSideTableViewCell.h"

@interface SHSideTableViewCell ()

@property (nonatomic, strong) UILabel                   *line;

@end

@implementation SHSideTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(SHSideModel *)model{
    if (self.line == nil) {
        self.line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, SCREEN_WIDTH, 0.5)];
        self.line.backgroundColor = [UIColor  shlightGrayColor];
        [self addSubview:self.line];
    }
    self.iconImage.image = [UIImage imageNamed:model.iconName];
    self.titleLabel.text = model.title;
    _model = model;
}

@end
