//
//  TeacherService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "TeacherDetail.h"
#import "Page.h"

@interface TeacherService : BaseRestService

//教师认证数据
- (NSArray *)getAuthDataWithUserID:(NSString *)userID;

//获取教师列表
- (Page *)listPageWithPage:(Page *)page andSearchKey:(NSString *)searchKey;

//收藏教师
- (BOOL)collectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId;

//取消收藏教师
- (BOOL)cancelCollectWithUserId:(NSString *)userId andTeacherId:(NSString *)teacherId;

//获取指定学生的收藏教师列表
- (Page *)getCollectTeachersByUserId:(NSString *)userId andPage:(Page *)page;

//获取教师信息
- (TeacherDetail *)getTeacherDetailById:(NSString *)userId;

//获取指定学生的预约教师列表
- (Page *)getOrderTeachersByUserId:(NSString *)userId Page:(Page *)openPage;

//获取指定学生的试听教师列表
- (Page *)getListenTeachersByUserId:(NSString *)userId Page:(Page *)openPage;

@end
