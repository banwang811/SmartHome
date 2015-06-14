//
//  SHRootSetingViewCell.h
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHTableViewCell.h"
#import "SHRoomSetingModel.h"

@interface SHRootSetingViewCell : SHTableViewCell

+ (SHRootSetingViewCell *)creatBaseInfoCell;

+ (SHRootSetingViewCell *)creatAddDeviceCell;

- (void)selectIcon:(NSString *)title imageName:(NSString *)imageName;

@property (nonatomic, copy) void (^selectButtonClick)();

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end
