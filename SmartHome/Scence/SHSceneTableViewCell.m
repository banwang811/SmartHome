//
//  SHSceneTableViewCell.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHSceneTableViewCell.h"

@interface SHSceneTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;


@end

@implementation SHSceneTableViewCell


- (void)setModel:(SHSceneModel *)model
{
    self.nameLabel.text = model.title;
    self.imageView.image = [UIImage imageNamed:model.iconName];
    _model = model;
}

- (IBAction)actionClick:(UIButton *)sender {
    
}


@end
