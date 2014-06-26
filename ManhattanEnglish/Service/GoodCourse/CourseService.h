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

@interface CourseService : BaseRestService

// 获取所有精品课程
- (Page *)listAllGoodCourses;

@end
