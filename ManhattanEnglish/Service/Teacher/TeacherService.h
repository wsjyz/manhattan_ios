//
//  TeacherService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "Page.h"

@interface TeacherService : BaseRestService

//教师认证数据
- (NSArray *)getAuthDataWithUserID:(NSString *)userID;

//获取教师列表
- (Page *)listPageWithPage:(Page *)page andSearchKey:(NSString *)searchKey;

//收藏教师
- (BOOL)collectWithUserId:(NSString *)userId;

//取消收藏教师
- (BOOL)cancelCollectWithUserId:(NSString *)userId;

@end
