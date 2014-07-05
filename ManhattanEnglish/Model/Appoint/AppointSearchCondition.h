//
//  AppointSearchCondition.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ConditionTagKcfl,
    ConditionTagJxdd,
    ConditionTagJxfs,
    ConditionTagJsxb,
    ConditionTagYyrq,
} ConditionTag;

@interface AppointSearchCondition : NSObject

@property (strong, nonatomic) NSString *courseCategory;
@property (strong, nonatomic) NSString *place;
@property (strong, nonatomic) NSString *tutoringWay;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSDate *appointmentTime;

@end
