//
//  TeacherDetail.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

#define TUTORING_WAY_STUDENT_VISIT      @"STUDENT_VISIT"
#define TUTORING_WAY_TEACHER_VISIT      @"TEACHER_VISIT"

#define STUDENT_LEVEL_JUNIOR            @"JUNIOR"
#define STUDENT_LEVEL_INTERMEDIATE      @"INTERMEDIATE"
#define STUDENT_LEVEL_SENIOR            @"SENIOR"

@interface TeacherDetail : NSObject

@property (nonatomic, strong) NSString *userId;         //教师ID
@property (nonatomic, strong) NSString *courseCategory;        //教授科目
@property (nonatomic, strong) NSString *authentication;         //身份认证
@property (nonatomic, strong) NSString *creditRate;         //信用等级
@property (nonatomic, strong) NSString *wechat;         //微信号
@property (nonatomic, strong) NSString *selfIntroduction;       //自我介绍
@property (nonatomic, strong) NSString *videoUrl;       //视频展示
@property (nonatomic, strong) NSString *appointmentPhone;       // 预约电话
@property (nonatomic, strong) NSString *expertScore;       // 专家评分
@property (nonatomic, strong) NSString *expertComments;       // 专家点评
@property (nonatomic, strong) NSString *teachingArea;       // 授课区域
@property (nonatomic, strong) NSString *tutoringWay;       // 辅导方式（学生上门STUDENT_VISIT;教师上门：TEACHER_VISIT）
@property (nonatomic, strong) NSString *studentLevel;       //学员程度(初级JUNIOR 中级INTERMEDIATE 高级SENIOR)
@property (nonatomic, assign) float classFees;       // 课时费
@property (nonatomic, strong) NSString *teachingTime;       // 可授课时间；0010001
@property (nonatomic, strong) NSString *finalGraduateSchool;       // 最高毕业院校
@property (nonatomic, strong) NSString *specialty;       // 专业
@property (nonatomic, strong) NSString *educationCertificate;       // 学历证明
@property (nonatomic, strong) NSString *experienceExam;       // 考过的考试
@property (nonatomic, strong) NSString *examScore;       // 考试成绩
@property (nonatomic, strong) NSString *examCertificate;       // 考试证明
@property (nonatomic, strong) NSString *teachingExperience;       // 过往教学经验
@property (nonatomic, strong) NSString *teachingCertificate;       // 教学证明
@property (nonatomic, strong) NSString *studentMaxScore;       // 学生最高分成绩
@property (nonatomic, strong) NSString *studentMaxScoreCertificate;       //  学生最高分成绩证明
@property (nonatomic, strong) NSString *authenticationStatus;       // 认证状态

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSMutableDictionary *extMap;

@property (nonatomic, assign) NSInteger focusCount;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, assign) NSInteger collectCount;

// custom properties
@property (nonatomic, strong, readonly) NSString *tutoringWayText;
@property (nonatomic, strong, readonly) NSString *studentLevelText;

@end
