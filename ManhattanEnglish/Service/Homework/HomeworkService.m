//
//  HomeworkService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "HomeworkService.h"

@interface HomeworkService ()
{
    OpenHomeworkService *_homeworkService;
}

@end

@implementation HomeworkService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _homeworkService = [[OpenHomeworkService alloc] initWithDelegate:delegate];
    }
    return self;
}

/**
 * 获取指定学生的作业列表
 * @return
 */
- (Page *)getHomeworksByUserWithPage:(Page*)page andUserID:(NSString *)userID
{
    return [_homeworkService getHomeworksByUserWithPage:page andUserID:userID];
}

/**
 * 获取指定教师的作业列表
 * @return
 */
- (Page *)getHomeworksByTeacherWithPage:(Page *)page andTeacherID:(NSString *)teacherID
{
    return [_homeworkService getHomeworksByTeacherWithPage:page andTeacherID:teacherID];
}

/**
 * 发布一个新的作业
 * @param homeWork
 */
- (HomeWork *)postHomeWorkL:(HomeWork *)homework
{
    return [_homeworkService postHomeWorkL:homework];
}

/**
 * 提交一个新的作业
 * @param homeworkSubmit
 */
- (HomeworkSubmit *)submitHomeWork:(HomeworkSubmit *)submitHomeWork FileData:(NSData *)data FileName:(NSString *)name
{
    return [_homeworkService submitHomeWork:submitHomeWork FileData:data FileName:name];
}

@end
