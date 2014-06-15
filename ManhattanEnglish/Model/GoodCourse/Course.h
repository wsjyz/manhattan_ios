//
//  Course.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TeacherDetail;

@interface Course : NSObject

@property (strong, nonatomic) NSString *courseId;
@property (strong, nonatomic) NSString *courseTitle;
@property (strong, nonatomic) NSString *courseSubtitle;
@property (strong, nonatomic) NSString *coursePic;
@property (strong, nonatomic) NSDate *startTime;
@property (strong, nonatomic) NSDate *endTime;
@property (assign, nonatomic) CGFloat period;
@property (assign, nonatomic) CGFloat expense;
@property (strong, nonatomic) NSString *place;
@property (strong, nonatomic) NSString *courseIntro;
@property (strong, nonatomic) NSString *appointmentPhone;
@property (strong, nonatomic) NSString *teachers;
@property (strong, nonatomic) NSString *courseCategory;
@property (strong, nonatomic) NSString *postTeacher;
@property (strong, nonatomic) NSString *videoUrl;
@property (strong, nonatomic) NSString *teachingTime;

@property (strong, nonatomic) NSArray *teacherList;

@end
