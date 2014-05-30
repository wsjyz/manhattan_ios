//
//  TeacherService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"

@interface TeacherService : BaseRestService

//教师认证数据
- (NSArray *)getAuthDataWithUserID:(NSString *)userID;

@end
