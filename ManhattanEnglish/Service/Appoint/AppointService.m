//
//  AppointService.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "AppointService.h"
#import "Course.h"
#import "AppointSearchCondition.h"
#import "Page.h"
#import "TeacherDetail.h"
#import "Option.h"
#import "User.h"
#import "Appointment.h"

@implementation AppointService (OpenExtension)

- (Page *)getOrderCoursesWithPage:(Page *)openPage andUserId:(NSString *)userId
{
    userId = @"t1";
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     userId, @"userId", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Course class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    [ReflectionUtil setArrayType:NSStringFromClass([TeacherDetail class]) forPropName:@"teacherDetailList" ofClassName:NSStringFromClass([Course class])];
    return [RestServiceManager performRequestWithPath:@"/course/getOrderCoursesByUserId" paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

- (Page *)getListenCoursesWithPage:(Page *)openPage andUserId:(NSString *)userId
{
    userId = @"t1";
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     userId, @"userId", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Course class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    [ReflectionUtil setArrayType:NSStringFromClass([TeacherDetail class]) forPropName:@"teacherDetailList" ofClassName:NSStringFromClass([Course class])];
    return [RestServiceManager performRequestWithPath:@"/course/getListenCoursesByUserId" paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

- (Page *)getOrderCourses:(Page *)openPage withCondition:(AppointSearchCondition *)condition
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(openPage), @"openPage",
                                     OPENVALUE(condition), @"queryParam", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Course class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    [ReflectionUtil setArrayType:NSStringFromClass([TeacherDetail class]) forPropName:@"teacherDetailList" ofClassName:NSStringFromClass([Course class])];
    return [RestServiceManager performRequestWithPath:@"/course/getOrderCourses" paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

- (Appointment *)addAppointment:(Appointment *)appoint
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(appoint), @"appointment", nil];
    return [RestServiceManager performRequestWithPath:@"/course/addAppointment" paramDic:paramDic returnType:NSStringFromClass([Appointment class]) delegate:self.delegate];
}

@end

@interface AppointService ()

@end

@implementation AppointService

#pragma mark - Public Services

- (NSArray *)optionsWithConditionTag:(ConditionTag)tag
{
    NSArray *options;
    
    if (tag == ConditionTagKcfl) {
        NSArray *optionValues = @[@"TOEFL", @"IELTS", @"SSAT", @"SAT", @"ACT", @"GRE", @"GMAT", @"LSAT"];
        options = [Option optionsWithSameTextAndValues:optionValues];
    }else if (tag == ConditionTagJxdd){
        NSArray *optionValues = @[@"崇明县", @"黄浦区", @"卢湾区", @"杨浦区", @"闵行区", @"宝山区", @"奉贤区", @"普陀区", @"闸北区", @"松江区", @"静安区", @"金山区", @"徐汇区", @"虹口区", @"长宁区", @"嘉定区", @"南汇区", @"青浦区", @"浦东新区"];
        options = [Option optionsWithSameTextAndValues:optionValues];
    }else if (tag == ConditionTagJxfs){
        NSDictionary *keyValueDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"STUDENT_VISIT", @"学生上门",
                                     @"TEACHER_VISIT", @"教师上门", nil];
        options = [Option optionsWithTextAndValueDic:keyValueDic];
    }else if (tag == ConditionTagJsxb){
        NSDictionary *keyValueDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     SEX_MALE, @"男",
                                     SEX_FEMALE, @"女",  nil];
        options = [Option optionsWithTextAndValueDic:keyValueDic];
    }else if (tag == ConditionTagStudentLevel){
        NSDictionary *keyValueDic = [NSDictionary dictionaryWithObjectsAndKeys:
                                     STUDENT_LEVEL_JUNIOR, @"初级",
                                     STUDENT_LEVEL_INTERMEDIATE, @"中级",
                                     STUDENT_LEVEL_SENIOR, @"高级", nil];
        options = [Option optionsWithTextAndValueDic:keyValueDic];
    }else{
    }
    return options;
}

- (Page *)findCourseWithAppointSearchCondition:(AppointSearchCondition *)condition
{
    Page *page = [[Page alloc] init];
    page.autoPaging = NO;
    page.autoCount = NO;
    
    return [self getOrderCourses:page withCondition:condition];
    
//    Course *course = [[Course alloc] init];
//    course.expense = 10000;
//    course.place = @"闵行";
//    course.courseTitle = @"SH041A";
//    course.coursePic = @"http://t1.baidu.com/it/u=2735361655,1422142452&fm=32&picname=2cdd6672560b55696e57df71a8791a8c.jpg";
//    
//    Course *course1 = [[Course alloc] init];
//    course1.expense = 18500;
//    course1.place = @"浦东";
//    course1.courseTitle = @"SH042B";
//    course1.coursePic = @"http://t1.baidu.com/it/u=2583661755,1127872947&fm=32&picname=5e10ccff57468f96931ea1e1c541a69c.jpg";
//    
//    Course *course2 = [[Course alloc] init];
//    course2.expense = 12800;
//    course2.place = @"奉贤";
//    course2.courseTitle = @"SH043A";
//    course2.coursePic = nil;
//    
//    Page *page = [[Page alloc] init];
//    page.rows = [NSMutableArray arrayWithArray:@[course, course1, course2]];
//    return page;
}

@end
