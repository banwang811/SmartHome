//
//  SHAddCell.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHAddCell.h"

@interface SHAddCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SHAddCell

- (void)setModel:(SHAddModel *)model
{
    self.headImage.image = [UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.title;
    _model = model;
}

@end
