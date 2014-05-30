//
//  OpenUserService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenUserService.h"

@implementation OpenUserService

/**
 * 获取人员信息
 * @param userId
 * @return
 */
- (User *)getUserWithUserID:(NSString *)userId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     [userId openValue], @"userId",nil];
    return [RestServiceManager performRequestWithPath:OpenUserService_getUser paramDic:paramDic returnType:NSStringFromClass([User class]) delegate:self.delegate];
}

/**
 * 更新用户信息
 * @param user
 * @return
 */
- (BOOL)updateUser:(User *)user
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     [user openValue], @"user",nil];
    return [[RestServiceManager performRequestWithPath:OpenUserService_updateUser paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

@end
