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
- (Page *)listPageWithPage:(Page *)page;

/**
 * 搜索教师列表
 *
 * @param searchKey
 * @return array<TeacherDetail>
 */
- (NSArray *)listByNameWithSearchKey:(NSString *)searchKey;

/**
 * 收藏教师
 *
 * @param userId
 * @param teacherId
 */
- (BOOL)collectWithUserId:(NSString *)userId;

/**
 * 取消收藏教师
 * @param userId
 * @param teacherId
 */
- (BOOL)cancelCollectWithUserId:(NSString *)userId;

@end
