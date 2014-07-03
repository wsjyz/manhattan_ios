//
//  TeacherDetail.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherDetail.h"

@implementation TeacherDetail

//（学生上门STUDENT_VISIT;教师上门：TEACHER_VISIT）
- (NSString *)tutoringWay
{
    if (_tutoringWay != nil && [_tutoringWay isEqualToString:@"STUDENT_VISIT"])
    {
        return @"学生上门";
    }
    else if (_tutoringWay != nil && [_tutoringWay isEqualToString:@"TEACHER_VISIT"])
    {
        return @"教师上门";
    }
    else
    {
        return _tutoringWay;
    }
}

//初级JUNIOR 中级INTERMEDIATE 高级SENIOR
- (NSString *)studentLevel
{
    if (_studentLevel == nil)
    {
        return _studentLevel;
    }
    
    if ([_studentLevel isEqualToString:@"JUNIOR"])
    {
        return @"初级";
    }
    else if ([_studentLevel isEqualToString:@"INTERMEDIATE"])
    {
        return @"中级";
    }
    else if ([_studentLevel isEqualToString:@"SENIOR"])
    {
        return @"高级";
    }
    else
    {
        return _studentLevel;
    }
}

- (NSInteger)focusCount
{
    if (_extMap != nil)
    {
         id count = [_extMap valueForKey:@"followCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

- (NSInteger)commentCount
{
    if (_extMap != nil)
    {
        id count = [_extMap valueForKey:@"commentCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

- (NSInteger)collectCount
{
    if (_extMap != nil)
    {
        id count = [_extMap valueForKey:@"collectCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

@end
