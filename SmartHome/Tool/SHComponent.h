//
//  SHComponent.h
//  SmartHome
//
//  Created by mac on 15/11/7.
//  Copyright © 2015年 banwang. All rights reserved.
//

#ifndef SHComponent_h
#define SHComponent_h

CG_INLINE void AlertlogError (NSString* message)
{
    static UIAlertView *alertView = nil;
    if (!alertView)
    {
        alertView = [[UIAlertView alloc] initWithTitle:  @""
                                               message: message
                                              delegate: nil
                                     cancelButtonTitle: @"OK"
                                     otherButtonTitles: nil,
                     nil];
        [alertView show];
    }
    else if ([alertView isVisible])
    {
        
        [alertView dismissWithClickedButtonIndex:0 animated:NO];
#if !__has_feature(objc_arc)
        [alertView release];
#else
#endif
        
        alertView = nil;
        alertView = [[UIAlertView alloc] initWithTitle:  @""
                                               message: message
                                              delegate: nil
                                     cancelButtonTitle: @"OK"
                                     otherButtonTitles: nil,
                     nil];
        [alertView show];
    }
    else
    {
        [alertView dismissWithClickedButtonIndex:0 animated:NO];
#if !__has_feature(objc_arc)
        [alertView release];
#else
#endif
        alertView = nil;
        alertView = [[UIAlertView alloc] initWithTitle:  @""
                                               message: message
                                              delegate: nil
                                     cancelButtonTitle: @"OK"
                                     otherButtonTitles: nil,
                     nil];
        [alertView show];
    }
}
#endif /* SHComponent_h */
