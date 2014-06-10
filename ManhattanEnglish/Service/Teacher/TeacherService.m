//
//  TeacherService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherService.h"
#import "OpenTeacherService.h"

@interface TeacherService ()
{
    OpenTeacherService *_teacherService;
}

@end

@implementation TeacherService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _teacherService = [[OpenTeacherService alloc] initWithDelegate:delegate];
    }
    return self;
}

//教师认证数据
- (NSArray *)getAuthDataWithUserID:(NSString *)userID
{
    return [_teacherService getAuthDataWithUserID:userID];
}

@end
