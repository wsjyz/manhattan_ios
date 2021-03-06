//
//  UserService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "UserService.h"
#import "OpenUserService.h"

@interface UserService ()
{
    OpenUserService *_userService;
}

@end

@implementation UserService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _userService = [[OpenUserService alloc] initWithDelegate:delegate];
    }
    return self;
}

//获取人员信息
- (User *)getUserWithUserID:(NSString *)userId
{
    return [_userService getUserWithUserID:userId];
}

//更新用户信息
- (BOOL)updateUser:(User *)user
{
    return [_userService updateUser:user];
}

//根据教师Id获取学生列表信息
- (Page *)getStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    return [_userService getStudentList:openPage TeacherID:@"t2"];
}

//根据教师Id获取预约学生列表信息
- (Page *)getOrderStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    return [_userService getOrderStudentList:openPage TeacherID:teacherId];
}

//根据教师Id获取试听学生列表信息
- (Page *)getListenStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    return [_userService getListenStudentList:openPage TeacherID:teacherId];
}

@end
