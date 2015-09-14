//
//  SHRoomTableViewCell.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomTableViewCell.h"

@interface SHRoomTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;


@end

@implementation SHRoomTableViewCell

- (void)drawRect:(CGRect)rect
{
    self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];
}

- (IBAction)deleteRoom:(UIButton *)sender {
    if (self.deleteRoom) {
        self.deleteRoom();
    }
}

- (void)setModel:(NSRoomModel *)model
{
    self.nameLabel.text = model.roomName;
    _model = model;
}

@end
