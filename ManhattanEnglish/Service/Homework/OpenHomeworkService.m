//
//  OpenHomeworkService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenHomeworkService.h"

@implementation OpenHomeworkService

/**
 * 获取指定学生的作业列表
 * @return
 */
- (Page *)getHomeworksByUserWithPage:(Page*)page andUserID:(NSString *)userID
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userID, @"userId",
                                     OPENVALUE(page), @"page", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([HomeWork class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:HomeWorkService_getHomeworksByUser paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 获取指定教师的作业列表
 * @return
 */
- (Page *)getHomeworksByTeacherWithPage:(Page *)page andTeacherID:(NSString *)teacherID
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(page), @"page",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([HomeWork class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:HomeWorkService_getHomeworksByTeacher paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 发布一个新的作业
 * @param homeWork
 */
- (HomeWork *)postHomeWorkL:(HomeWork *)homework
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(homework), @"homework",nil];
    return [RestServiceManager performRequestWithPath:HomeWorkService_postHomeWork paramDic:paramDic returnType:NSStringFromClass([HomeWork class]) delegate:self.delegate];
}

/**
 * 提交一个新的作业
 * @param homeworkSubmit
 */
- (HomeworkSubmit *)submitHomeWork:(HomeworkSubmit *)submitHomeWork
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(submitHomeWork), @"submitHomeWork",nil];
    return [RestServiceManager performRequestWithPath:HomeWorkService_submitHomeWork paramDic:paramDic returnType:NSStringFromClass([submitHomeWork class]) delegate:self.delegate];
}

@end
