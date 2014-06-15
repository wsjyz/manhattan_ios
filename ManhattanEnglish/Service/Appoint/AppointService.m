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

@interface AppointService ()

@end

@implementation AppointService

#pragma mark - Public Services

- (NSArray *)optionsWithConditionTag:(ConditionTag)tag
{
    NSArray *options;
    switch (tag) {
        case ConditionTagKcfl:
            options = @[@"TOEFL", @"IELTS", @"SSAT", @"SAT", @"ACT", @"GRE", @"GMAT", @"LSAT"];
            break;
        case ConditionTagJxdd:
            options = @[@"崇明县", @"黄浦区", @"卢湾区", @"杨浦区", @"闵行区", @"宝山区", @"奉贤区", @"普陀区", @"闸北区", @"松江区", @"静安区", @"金山区", @"徐汇区", @"虹口区", @"长宁区", @"嘉定区", @"南汇区", @"青浦区", @"浦东新区"];
            break;
        case ConditionTagJxfs:
            options = @[@"学生上门", @"教师上门"];
            break;
        case ConditionTagJsxb:
            options = @[@"男", @"女"];
            break;
        default:
            break;
    }
    return options;
}

- (NSArray *)findCourseWithAppointSearchCondition:(AppointSearchCondition *)condition
{
    Course *course = [[Course alloc] init];
    course.expense = 10000;
    course.place = @"闵行";
    course.courseTitle = @"SH041A";
    course.coursePic = @"http://t1.baidu.com/it/u=2735361655,1422142452&fm=32&picname=2cdd6672560b55696e57df71a8791a8c.jpg";
    
    Course *course1 = [[Course alloc] init];
    course1.expense = 18500;
    course1.place = @"浦东";
    course1.courseTitle = @"SH042B";
    course1.coursePic = @"http://t1.baidu.com/it/u=2583661755,1127872947&fm=32&picname=5e10ccff57468f96931ea1e1c541a69c.jpg";
    
    Course *course2 = [[Course alloc] init];
    course2.expense = 12800;
    course2.place = @"奉贤";
    course2.courseTitle = @"SH043A";
    course2.coursePic = nil;
    
    return @[course, course1, course2];
}

@end
