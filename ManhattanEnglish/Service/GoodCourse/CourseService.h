//
//  CourseService.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRestService.h"

@class Course;
@class Page;
@class TeacherDetail;

@interface CourseService : BaseRestService


//- (Page *)listAllGoodCourses;

@end

@interface CourseService (OpenExtension)

- (TeacherDetail *)postCourse:(TeacherDetail *)detail;

// 获取所有精品课程
- (Page *)getWorthCourses:(Page *)openPage;

// 获取指定学生的课程日历表
- (NSArray *)getScheduleWithStartTime:(NSDate *)startTime endTime:(NSDate *)endTime userId:(NSString *)userId;

@end

