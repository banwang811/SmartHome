//
//  SHSideTableViewCell.h
//  SmartHome
//
//  Created by mac on 15/9/14.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHSideModel.h"

@interface SHSideTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView        *iconImage;

@property (weak, nonatomic) IBOutlet UILabel            *titleLabel;

@property (nonatomic, strong) SHSideModel               *model;

@end
