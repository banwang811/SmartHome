//
//  NSSceneModel.h
//  SmartHome
//
//  Created by banwang on 15/6/10.
//  Copyright (c) 2015年 banwang. All rights reserved.
//

#import "NSMeapDBBaseObject.h"

@interface NSSceneModel : NSMeapDBBaseObject

@property (nonatomic, strong) NSString              *sceneID;

@property (nonatomic, strong) NSString              *sceneName;

@property (nonatomic, strong) NSString              *sceneIcon;

@property (nonatomic, strong) NSString              *sceneMembers;

@property (nonatomic, strong) NSString              *extension;


+ (NSArray *)fetchScenes;

@end
