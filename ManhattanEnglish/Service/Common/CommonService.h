//
//  CommonService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRestService.h"

@interface CommonService : BaseRestService

- (BOOL)isFirstLauch;

- (void)updateCurrentPersonalID:(PERSONAL_ID)personalID;

- (PERSONAL_ID)getCurrentPersonalID;

- (NSString *)getLastLoginMobile;

- (NSString *)getLastLoginUserPassword;

- (void)updateLastLoginUserPassword:(NSString *)password;

- (void)saveAndUpdateLastLoginMobile:(NSString *)mobile Password:(NSString *)password;
//存储判断是否自动登录的字段checkBox
- (void)saveAndUpdateLastLoginCheckBox:(BOOL)checked;

//获取判断是否自动登录的字段checkBox
- (BOOL)getLoginCheckBox;

@end
