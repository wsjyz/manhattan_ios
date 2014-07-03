//
//  TeacherDetail.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherDetail.h"

@implementation TeacherDetail

- (NSInteger)focusCount
{
    if (self.extMap != nil)
    {
         id count = [self.extMap valueForKey:@"followCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

- (NSInteger)commentCount
{
    if (self.extMap != nil)
    {
        id count = [self.extMap valueForKey:@"commentCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

- (NSInteger)collectCount
{
    if (self.extMap != nil)
    {
        id count = [self.extMap valueForKey:@"collectCount"];
        if (count != nil)
        {
            return [count integerValue];
        }
    }
    return 0;
}

@end
