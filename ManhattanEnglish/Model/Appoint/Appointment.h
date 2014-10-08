//
//  Appointment.h
//  ManhattanEnglish
//
//  Created by Alex on 7/5/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RESOURCE_TYPE_APPOINTMENT_COURSE        @"APPOINTMENT_COURSE"
#define RESOURCE_TYPE_LISTEN_COURSE             @"LISTEN_COURSE"
#define RESOURCE_TYPE_APPOINTMENT_TEACHER       @"APPOINTMENT_TEACHER"
#define RESOURCE_TYPE_LISTEN_TEACHER            @"LISTEN_TEACHER"

/*
 appointmentId 预约ID
 userId
 courseCategory 学习科目
 tutoringWay 授课方式（学生上门STUDENT_VISIT;教师上面：TEACHER_VISIT）
 otherContent 补充说明
 mobile 手机号
 phone 电话
 qq
 address 地址
 appointmentTime 预约时间
 resourceType '预约类型(试听课程LISTEN_COURSE;预约课程APPOINTMENT_COURSE;试听教师LISTEN_TEACHER;预约教师APPOINTMENT_TEACHER)'
 resourceId 关联ID
 payment 付款方式(网上付款ONLINE；后台付款ADMIN)'
 */
@interface Appointment : NSObject

@property (strong, nonatomic) NSString *appointmentId;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *courseCategory;
@property (strong, nonatomic) NSString *tutoringWay;
@property (strong, nonatomic) NSString *otherContent;
@property (strong, nonatomic) NSString *mobile;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *qq;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *appointmentTime;
@property (strong, nonatomic) NSString *resourceType;
@property (strong, nonatomic) NSString *resourceId;
@property (strong, nonatomic) NSString *payment;

@property (strong, nonatomic) NSString *userName;

@end
