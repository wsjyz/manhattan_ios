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
#define KEY_LAST_LOGIN_MOBILE               @"lastLoginMobile"
#define KEY_LAST_LOGIN_PASSWORD             @"lastLoginPassword"
#define KEY_LAST_LOGIN_CHECK_BOX            @"lastLoginCheckBox"

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
    [defaults synchronize];
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
        NSNumber *objNumber =object;
        PERSONAL_ID personalID = (PERSONAL_ID)[objNumber integerValue];
        return personalID;
    }
}

- (NSString *)getLastLoginMobile
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:KEY_LAST_LOGIN_MOBILE];
}

- (NSString *)getLastLoginUserPassword
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults stringForKey:KEY_LAST_LOGIN_PASSWORD];
}

- (void)updateLastLoginUserPassword:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:password forKey:KEY_LAST_LOGIN_PASSWORD];
    [defaults synchronize];
}

- (void)saveAndUpdateLastLoginMobile:(NSString *)mobile Password:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:mobile forKey:KEY_LAST_LOGIN_MOBILE];
    [defaults setObject:password forKey:KEY_LAST_LOGIN_PASSWORD];
    [defaults synchronize];
}

//存储判断是否自动登录的字段checkBox
- (void)saveAndUpdateLastLoginCheckBox:(BOOL)checked
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(checked) forKey:KEY_LAST_LOGIN_CHECK_BOX];
    [defaults synchronize];
}

//获取判断是否自动登录的字段checkBox
- (BOOL)getLoginCheckBox
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:KEY_LAST_LOGIN_CHECK_BOX];
}

@end
