//
//  UserService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "OpenUserService.h"

@interface UserService : BaseRestService


//获取人员信息
- (User *)getUserWithUserID:(NSString *)userId;

//更新用户信息
- (BOOL)updateUser:(User *)user;

//根据教师Id获取学生列表信息
- (Page *)getStudentList:(Page *)openPage TeacherID:(NSString *)teacherId;

//根据教师Id获取预约学生列表信息
- (Page *)getOrderStudentList:(Page *)openPage TeacherID:(NSString *)teacherId;

//根据教师Id获取试听学生列表信息
- (Page *)getListenStudentList:(Page *)openPage TeacherID:(NSString *)teacherId;

@end
