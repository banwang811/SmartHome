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


- (void)setModel:(NSSceneModel *)model
{
    self.nameLabel.text = model.sceneName;
    self.imageView.image = [UIImage imageNamed:model.sceneIcon];
    _model = model;
}

- (IBAction)actionClick:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                    message:@"开发中"
                                                   delegate:self
                                          cancelButtonTitle:@"确定"
                                          otherButtonTitles:nil, nil];
    [alert show];
}


@end
