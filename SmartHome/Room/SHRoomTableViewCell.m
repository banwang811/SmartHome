//
//  SHRoomTableViewCell.m
//  SmartHome
//
//  Created by banwang on 15/6/2.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRoomTableViewCell.h"

#define XHTableViewCellControlSpaceing 2

@implementation SHRoomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.roomView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark - getter & setter

- (SHRoomView *)roomView
{
    if (!_roomView) {
        CGRect rect = CGRectMake(0, 0, self.frame.size.width, 0);
        _roomView = [[SHRoomView alloc] initWithFrame:rect];
        _roomView.backgroundColor = [UIColor whiteColor];
    }
    return _roomView;
}

// over write
- (void)setFrame:(CGRect)frame
{
    frame.size.width = [[UIScreen mainScreen] applicationFrame].size.width;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setCellModel:(SHRoomCellModel *)cellModel
{
    _roomView.roomModel = cellModel;
    
    _height = CGRectGetMaxY(_roomView.frame) + XHTableViewCellControlSpaceing;
}

@end
