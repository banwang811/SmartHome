//
//  SHError.h
//  SmartHome
//
//  Created by mac on 15/11/7.
//  Copyright © 2015年 banwang. All rights reserved.
//

#ifndef SHError_h
#define SHError_h

typedef NS_ENUM(NSInteger,SHErrorSatate) {
    //登陆成功
    SHErrorSatate_LoginSuccess = 0,
    //登陆失败
    SHErrorSatate_LoginFailed = 101,
    //email已经注册
    SHErrorSatate_EmailRegisted = 102,
    //phone已经注册
    SHErrorSatate_PhoneRegisted = 103,

};

#endif
