//
//  CommonUtil+CustomExtension.m
//  ManhattanEnglish
//
//  Created by Alex on 6/27/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import "CommonUtil+CustomExtension.h"

@implementation CommonUtil (CustomExtension)

+ (Page *)defaultPage
{
    Page *page = [[Page alloc] init];
    page.autoPaging = NO;
    page.autoCount = NO;
    return page;
}

+ (NSArray *)getFirstAndLastDateOfCurrentMonth
{
    NSDate *curDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:curDate]; // Get necessary date components

    comps.day = 1;

    NSDate *firstDay = [calendar dateFromComponents:comps];
    
    comps.month += 1;
    comps.day = 0;
    
    NSDate *lastDay = [calendar dateFromComponents:comps];
    
    return @[firstDay, lastDay];
}

@end
