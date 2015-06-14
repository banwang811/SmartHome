//
//  SHRootSetingViewCell.m
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHRootSetingViewCell.h"

@interface SHRootSetingViewCell()

@property (weak, nonatomic) IBOutlet UILabel *iconName;

@property (weak, nonatomic) IBOutlet UIButton *selectIcon;

@property (weak, nonatomic) IBOutlet UITextField *roomNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *deviceNumber;


@end

@implementation SHRootSetingViewCell


+ (SHRootSetingViewCell *)creatBaseInfoCell
{
    SHRootSetingViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRootSetingViewCell" owner:self options:nil] objectAtIndex:0];
    return cell;
}

+ (SHRootSetingViewCell *)creatAddDeviceCell
{
     SHRootSetingViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"SHRootSetingViewCell" owner:self options:nil] objectAtIndex:1];
    return cell;
}

- (void)drawRect:(CGRect)rect
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];
}

- (IBAction)selectRoomIcon:(UIButton *)sender {
    
    if (self.selectButtonClick)
    {
        self.selectButtonClick();
    }
}

- (void)selectIcon:(NSString *)title imageName:(NSString *)imageName
{
    self.iconName.text = title;
    self.roomNameTextField.text = title;
    [self.selectIcon setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
@end
