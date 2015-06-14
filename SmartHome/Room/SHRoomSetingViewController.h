//
//  SHRoomSetingViewController.h
//  SmartHome
//
//  Created by banwang on 15/6/4.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "SHBaseViewController.h"
typedef enum {
    SHSetingViewType_room,
    SHSetingViewType_scene,
}SHSetingViewType;

@interface SHRoomSetingViewController : SHBaseViewController

- (id)initWithType:(SHSetingViewType)type;

@end
