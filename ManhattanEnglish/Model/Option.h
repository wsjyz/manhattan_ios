//
//  Option.h
//  ManhattanEnglish
//
//  Created by Alex on 7/5/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Option : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *optionValue;

+ (id) optionWithText:(NSString *)text andValue:(NSString *)value;

// key: displayText value:value
+ (NSArray *) optionsWithTextAndValueDic:(NSDictionary *)dic;

+ (NSArray *) optionsWithSameTextAndValues:(NSArray *)values;

@end
