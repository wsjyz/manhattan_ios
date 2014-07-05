//
//  OpenTeacherService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "Page.h"
#import "TeacherDetail.h"

@interface OpenTeacherService : BaseRestService

/**
 * 教师认证数据
 *
 * @param userId
 * @return 包含图片路径的数组
 */
- (NSArray *)getAuthDataWithUserID:(NSString *)userID;

/**
 * 获取教师列表
 *
 * @param page
 * @return Page<TeacherDetail>
 */
- (Page *)listPageWithPage:(Page *)page andSearchKey:(NSString *)searchKey;

/**
 * 收藏教师
 *
 * @param userId
 * @param teacherId
 */
- (BOOL)collectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId;

/**
 * 取消收藏教师
 * @param userId
 * @param teacherId
 */
- (BOOL)cancelCollectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId;

/**
 * 获取指定学生的收藏教师列表
 * @return
 */
- (Page *)getCollectTeachersByUserId:(NSString *)userId andPage:(Page *)page;

/**
 * 获取教师信息
 *
 * @param userId
 * @return TeacherDetail
 */
- (TeacherDetail *)getTeacherDetailById:(NSString *)userId;

/**
 * 获取指定学生的预约教师列表
 * @return OpenPage<TeacherDetail>
 */
- (Page *)getOrderTeachersByUserId:(NSString *)userId Page:(Page *)openPage;

/**
 * 获取指定学生的试听教师列表
 * @return OpenPage<TeacherDetail>
 */
- (Page *)getListenTeachersByUserId:(NSString *)userId Page:(Page *)openPage;

@end
