//
//  SHSetingCell.m
//  SmartHome
//
//  Created by banwang on 15/6/13.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSetingCell.h"

@interface SHSetingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation SHSetingCell

- (void)setModel:(SHSetingModel *)model
{
    self.headImage.image = [UIImage imageNamed:model.iconName];
    self.nameLabel.text = model.title;
    _model = model;
}


@end
