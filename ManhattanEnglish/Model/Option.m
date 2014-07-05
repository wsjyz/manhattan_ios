//
//  Option.m
//  ManhattanEnglish
//
//  Created by Alex on 7/5/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import "Option.h"

@implementation Option

+ (id)optionWithText:(NSString *)text andValue:(NSString *)value
{
    Option *option = [[self alloc] init];
    option.text = text;
    option.optionValue = value;
    return option;
}

+ (NSArray *)optionsWithSameTextAndValues:(NSArray *)values
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:values.count];
    for (NSString *value in values) {
        Option *option = [self optionWithText:value andValue:value];
        [array addObject:option];
    }
    return array;
}

+ (NSArray *)optionsWithTextAndValueDic:(NSDictionary *)dic
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:dic.count];
    for (NSString *key in dic) {
        Option *option = [self optionWithText:key andValue:dic[key]];
        [array addObject:option];
    }
    return array;
}

@end
