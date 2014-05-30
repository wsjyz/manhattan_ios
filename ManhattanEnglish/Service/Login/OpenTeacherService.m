//
//  OpenTeacherService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenTeacherService.h"

@implementation OpenTeacherService

/**
 * 教师认证数据
 *
 * @param userId
 * @return 包含图片路径的数组
 */
- (NSArray *)getAuthDataWithUserID:(NSString *)userID
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     [userID openValue], @"userID",nil];
    return [RestServiceManager performRequestWithPath:OpenTeacherSerice_getAuthData paramDic:paramDic returnType:NSStringFromClass([NSString class]) delegate:self.delegate];
}


@end
