//
//  OpenUserService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenUserService.h"

@implementation OpenUserService

/**
 * 获取人员信息
 * @param userId
 * @return
 */
- (User *)getUserWithUserID:(NSString *)userId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userId, @"userId",nil];
    return [RestServiceManager performRequestWithPath:OpenUserService_getUser paramDic:paramDic returnType:NSStringFromClass([User class]) delegate:self.delegate];
}

/**
 * 更新用户信息
 * @param user
 * @return
 */
- (BOOL)updateUser:(User *)user
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(user), @"user",nil];
    return [[RestServiceManager performRequestWithPath:OpenUserService_updateUser paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

/**
 * 根据教师Id获取学生列表信息
 * @param OpenPage<User>
 */
- (Page *)getStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     teacherId,@"teacherId",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([User class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenUserService_getStudentList paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 根据教师Id获取预约学生列表信息
 * @param OpenPage<User>
 */
- (Page *)getOrderStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     teacherId,@"teacherId",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([User class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenUserService_getOrderStudentList paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 根据教师Id获取试听学生列表信息
 * @param OpenPage<User>
 */
- (Page *)getListenStudentList:(Page *)openPage TeacherID:(NSString *)teacherId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     teacherId,@"teacherId",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([User class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenUserService_getListenStudentList paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

@end
