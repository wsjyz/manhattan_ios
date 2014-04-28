//
//  CommonService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CommonService.h"

#define KEY_FIRST_LAUCH                     @"firstLauch"

@implementation CommonService

- (BOOL)isFirstLauch
{
    BOOL isFirstlauch;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id firstObj = [defaults objectForKey:KEY_FIRST_LAUCH];
    if (firstObj == nil)
    {
        isFirstlauch = YES;
    }
    else
    {
        isFirstlauch = [defaults boolForKey:KEY_FIRST_LAUCH];
    }
    
    if (isFirstlauch)
    {
        [defaults setBool:NO forKey:KEY_FIRST_LAUCH];
    }
    
    return isFirstlauch;
}

@end
