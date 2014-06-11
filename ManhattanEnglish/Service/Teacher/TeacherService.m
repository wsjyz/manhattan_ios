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
- (Page *)listPageWithPage:(Page *)page
{
    return [_teacherService listPageWithPage:page];
}

//搜索教师列表
- (NSArray *)listByNameWithSearchKey:(NSString *)searchKey
{
    return [_teacherService listByNameWithSearchKey:searchKey];
}

//收藏教师
- (BOOL)collectWithUserId:(NSString *)userId
{
    return [_teacherService collectWithUserId:userId];
}

//取消收藏教师
- (BOOL)cancelCollectWithUserId:(NSString *)userId
{
    return [_teacherService cancelCollectWithUserId:userId];
}

@end
