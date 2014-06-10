//
//  TeacherDetail.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherDetail : NSObject

@property (nonatomic, strong) NSString *teacherId;

@property (nonatomic, strong) NSString *avatarUrl;

@property (nonatomic, strong) NSString *name;

/**
 * 性别：
 * MALE
 * FEMALE
 */
@property (nonatomic, strong) NSString *sex;

@property (nonatomic, strong) NSString *college;

@property (nonatomic, strong) NSString *mainSubject;

/**
 * 评分
 */
@property (nonatomic, assign) int rating;

@property (nonatomic, strong) NSString *evaluation;

@property (nonatomic, strong) NSString *availableLocation;

/**
 * 辅导方式
 */
@property (nonatomic, strong) NSString *teachWay;

@property (nonatomic, assign) int focusCount;

@property (nonatomic, assign) int commentCount;

@property (nonatomic, assign) int collectCount;

@property (nonatomic, strong) NSString *introduction;

@property (nonatomic, strong) NSString *requiredLevel;

/**
 * 授课方式
 */
@property (nonatomic, strong) NSString *teachMethod;

@property (nonatomic, assign) int cost;

@end
