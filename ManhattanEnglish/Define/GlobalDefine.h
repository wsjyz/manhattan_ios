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

typedef enum
{
    PERSONAL_GUEST = 0,
    PERSONAL_TEACHER = 1,           //教师
    PERSONAL_STUDENT = 2,           //学生
    PERSONAL_VIP = 3                //VIP
}PERSONAL_ID;

//（TEACHER;STUDENT;VIPSTUDENT）
#define TYPE_TEACHER                    @"TEACHER"
#define TYPE_STUDENT                    @"STUDENT"
#define TYPE_VIPSTUDENT                 @"VIPSTUDENT"

#endif
