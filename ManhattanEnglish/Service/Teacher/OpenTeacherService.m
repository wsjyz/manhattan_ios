//
//  OpenTeacherService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenTeacherService.h"

@implementation OpenTeacherService

/**
 * 教师认证数据
 *
 * @param userId
 * @return 包含图片路径的数组
 */
- (NSArray *)getAuthDataWithUserID:(NSString *)userID
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userID, @"userID",nil];
    return [RestServiceManager performRequestWithPath:OpenTeacherSerice_getAuthData paramDic:paramDic returnType:NSStringFromClass([NSString class]) delegate:self.delegate];
}

/**
 * 获取教师列表
 *
 * @param page
 * @return Page<TeacherDetail>
 */
- (Page *)listPageWithPage:(Page *)page andSearchKey:(NSString *)searchKey
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(page), @"page",
                                     searchKey,@"searchKey",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([TeacherDetail class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenTeacherService_listPage paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 收藏教师
 *
 * @param userId
 * @param teacherId
 */
- (BOOL)collectWithUserId:(NSString *)userId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userId, @"userId", nil];
    return [[RestServiceManager performRequestWithPath:OpenTeacherService_collect paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

/**
 * 取消收藏教师
 * @param userId
 * @param teacherId
 */
- (BOOL)cancelCollectWithUserId:(NSString *)userId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userId, @"userId", nil];
    return [[RestServiceManager performRequestWithPath:OpenTeacherService_cancelCollect paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

@end
