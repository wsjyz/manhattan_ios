//
//  AppointService.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRestService.h"
#import "AppointSearchCondition.h"

@class Page;
@class Appointment;

@interface AppointService : BaseRestService

// 根据查询条件标识获取对应的选项列表
- (NSArray *)optionsWithConditionTag:(ConditionTag)tag;

//- (Page *)findCourseWithAppointSearchCondition:(AppointSearchCondition *)condition;

@end


@interface AppointService (OpenExtension)

// 获取指定学生的预约课程列表
- (Page *)getOrderCoursesWithPage:(Page *)openPage andUserId:(NSString *)userId;

// 获取指定学生的试听课程列表
- (Page *)getListenCoursesWithPage:(Page *)openPage andUserId:(NSString *)userId;

// 根据指定条件搜索可预约课程
// 搜索条件包括分类，地点，预约日期，教师性别，教学方式
- (Page *)getOrderCourses:(Page *)openPage withCondition:(AppointSearchCondition *)condition;

// 添加预约\试听课程记录
- (Appointment *)addAppointment:(Appointment *)appoint;

@end