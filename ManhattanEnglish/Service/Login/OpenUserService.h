//
//  OpenUserService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "User.h"

@interface OpenUserService : BaseRestService

/**
 * 获取人员信息
 * @param userId
 * @return
 */
- (User *)getUserWithUserID:(NSString *)userId;

/**
 * 更新用户信息
 * @param user
 * @return
 */
- (BOOL)updateUser:(User *)user;

@end
