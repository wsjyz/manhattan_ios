//
//  GlobalDefine.h
//  WorkFlow
//
//  Created by liujiafei on 14-1-15.
//  Copyright (c) 2014年 liujiafei. All rights reserved.
//

#ifndef WorkFlow_GlobalDefine_h
#define WorkFlow_GlobalDefine_h

#import "GlobalFrameDefine.h"
#import "GlobalImageDefine.h"
#import "GlobalStringDefine.h"
#import "GlobalErrorDefine.h"
#import "GlobalOpenDefine.h"

#ifdef DEBUG
#define DebugLog(fmt,...) NSLog(@"%@",[NSString stringWithFormat:(fmt), ##__VA_ARGS__]);
#else
// If debug mode hasn't been enabled, don't do anything when the macro is called
#define DebugLog(...)
#endif



#endif
