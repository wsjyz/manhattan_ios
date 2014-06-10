//
//  UserService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "OpenUserService.h"

@interface UserService : BaseRestService


//获取人员信息
- (User *)getUserWithUserID:(NSString *)userId;

//更新用户信息
- (BOOL)updateUser:(User *)user;

@end
