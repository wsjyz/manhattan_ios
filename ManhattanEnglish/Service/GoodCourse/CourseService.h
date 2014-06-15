//
//  CourseService.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Course;

@interface CourseService : NSObject

// 获取所有精品课程
- (NSArray *)listAllGoodCourses;

@end
