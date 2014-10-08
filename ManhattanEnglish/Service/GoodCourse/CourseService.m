//
//  CourseService.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CourseService.h"
#import "Course.h"
#import "Page.h"
#import "TeacherDetail.h"

@implementation CourseService (OpenExtension)

- (TeacherDetail *)postCourse:(TeacherDetail *)detail
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(detail), @"teacherDetail", nil];
    return [RestServiceManager performRequestWithPath:@"/course/postCourses" paramDic:paramDic returnType:NSStringFromClass([TeacherDetail class]) delegate:self.delegate];
}

- (Page *)getWorthCourses:(Page *)openPage
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Course class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    [ReflectionUtil setArrayType:NSStringFromClass([TeacherDetail class]) forPropName:@"teacherDetailList" ofClassName:NSStringFromClass([Course class])];
    return [RestServiceManager performRequestWithPath:@"/course/getWorthCourses" paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

- (NSArray *)getScheduleWithStartTime:(NSDate *)startTime endTime:(NSDate *)endTime userId:(NSString *)userId
{
//    startTime = [CommonUtil dateWithString:@"2014-06-21" withFormatStr:yyyy_MM_dd];
//    endTime = [CommonUtil dateWithString:@"2014-06-26" withFormatStr:yyyy_MM_dd];
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                    [CommonUtil stringWithDate:startTime andFormatStr:yyyy_MM_dd], @"startTime",
                                    [CommonUtil stringWithDate:endTime andFormatStr:yyyy_MM_dd], @"endTime",
                                     userId, @"userId", nil];
    return [RestServiceManager performRequestWithPath:@"/course/getSchedule" paramDic:paramDic returnType:NSStringFromClass([NSDate class]) delegate:self.delegate];
}

@end


@implementation CourseService

- (Page *)listAllGoodCourses
{
    Page *page = [[Page alloc] init];
    page.autoPaging = NO;
    page.autoCount = NO;
    
    return [self getWorthCourses:page];
    
//    Course *course = [[Course alloc] init];
//    course.expense = 10000;
//    course.place = @"闵行";
//    course.courseTitle = @"SH041A";
//    course.coursePic = @"http://t1.baidu.com/it/u=2735361655,1422142452&fm=32&picname=2cdd6672560b55696e57df71a8791a8c.jpg";
//    course.period = 15.0;
//    course.courseIntro = @"这就是本门课程的介绍";
//    course.courseSubtitle = @"这是非常容易学习的课程之一！";
//    course.startTime = [CommonUtil dateWithString:@"2014-1-1" withFormatStr:yyyy_MM_dd];
//    course.endTime = [CommonUtil dateWithString:@"2014-6-30" withFormatStr:yyyy_MM_dd];
//    
//    Course *course1 = [[Course alloc] init];
//    course1.expense = 18500;
//    course1.place = @"浦东";
//    course1.courseTitle = @"SH042B";
//    course1.coursePic = @"http://t1.baidu.com/it/u=2583661755,1127872947&fm=32&picname=5e10ccff57468f96931ea1e1c541a69c.jpg";
//    course1.period = 35.0;
//    course1.courseIntro = @"暂无";
//    course1.courseSubtitle = @"暂无";
//    course1.startTime = [CommonUtil dateWithString:@"2013-11-1" withFormatStr:yyyy_MM_dd];
//    course1.endTime = [CommonUtil dateWithString:@"2014-2-30" withFormatStr:yyyy_MM_dd];
//    
//    Course *course2 = [[Course alloc] init];
//    course2.expense = 12800;
//    course2.place = @"奉贤";
//    course2.courseTitle = @"SH043A";
//    course2.coursePic = nil;
//    course2.period = 25.0;
//    course2.courseIntro = @"无聊的课程";
//    course2.courseSubtitle = @"附属内容暂无";
//    course2.startTime = [CommonUtil dateWithString:@"2014-3-1" withFormatStr:yyyy_MM_dd];
//    course2.endTime = [CommonUtil dateWithString:@"2014-3-30" withFormatStr:yyyy_MM_dd];
//    
//    return @[course, course1, course2];
}

@end
