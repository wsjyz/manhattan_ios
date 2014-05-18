//
//  CommonService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CommonService.h"

#define KEY_FIRST_LAUCH                     @"firstLauch"
#define KEY_PERSONALE_ID                    @"personalID"

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

- (void)updateCurrentPersonalID:(PERSONAL_ID)personalID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:@(personalID) forKey:KEY_PERSONALE_ID];
//    [defaults synchronize];
}

- (PERSONAL_ID)getCurrentPersonalID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    id object = [defaults objectForKey:KEY_PERSONALE_ID];
    if (object == nil)
    {
        return PERSONAL_STUDENT;
    }
    else
    {
        PERSONAL_ID personalID = (PERSONAL_ID)[object integerValue];
        return personalID;
    }
}

@end
