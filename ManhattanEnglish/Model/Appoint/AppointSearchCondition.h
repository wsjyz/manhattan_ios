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

@property (strong, nonatomic) NSArray *courseCategory;
@property (strong, nonatomic) NSArray *place;
@property (strong, nonatomic) NSArray *tutoringWay;
@property (strong, nonatomic) NSString *sex;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;

@end
