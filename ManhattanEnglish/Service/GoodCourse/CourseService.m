//
//  CourseService.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CourseService.h"
#import "Course.h"

@implementation CourseService

- (NSArray *)listAllGoodCourses
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
