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

//获取教师列表
- (Page *)listPageWithPage:(Page *)page andSearchKey:(NSString *)searchKey
{
    return [_teacherService listPageWithPage:page andSearchKey:searchKey];
}

//收藏教师
- (BOOL)collectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId
{
    return [_teacherService collectWithUserId:userId andTeacherId:teacherId];
}

//取消收藏教师
- (BOOL)cancelCollectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId
{
    return [_teacherService cancelCollectWithUserId:userId andTeacherId:teacherId];
}

//获取指定学生的收藏教师列表
- (Page *)getCollectTeachersByUserId:(NSString *)userId andPage:(Page *)page
{
    return [_teacherService getCollectTeachersByUserId:userId andPage:page];
}

//获取教师信息
- (TeacherDetail *)getTeacherDetailById:(NSString *)userId
{
    return [_teacherService getTeacherDetailById:userId];
}

//获取指定学生的预约教师列表
- (Page *)getOrderTeachersByUserId:(NSString *)userId Page:(Page *)openPage
{
    return [_teacherService getOrderTeachersByUserId:userId Page:openPage];
}

//获取指定学生的试听教师列表
- (Page *)getListenTeachersByUserId:(NSString *)userId Page:(Page *)openPage
{
    return [_teacherService getListenTeachersByUserId:userId Page:openPage];
}

@end
