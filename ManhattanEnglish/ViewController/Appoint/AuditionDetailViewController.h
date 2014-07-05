//
//  AuditionDetailViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@class TeacherDetail;
@class Course;

@interface AuditionDetailViewController : BaseViewController

// 试听还是预约
@property (assign, nonatomic) BOOL isAudition;

// 课程还是老师
@property (assign, nonatomic) BOOL isTeacher;

// 如果是教师的需要设置该属性
@property (strong, nonatomic) TeacherDetail *teacherDetail;

// 如果是课程需要设置该属性
@property (strong, nonatomic) Course *course;

@property (weak, nonatomic) IBOutlet UIButton *auditionBtn;

- (IBAction)confirmBtnClick:(id)sender;

@end
