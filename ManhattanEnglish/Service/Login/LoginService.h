//
//  LoginService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-25.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OpenLoginService.h"

@interface LoginService : BaseRestService

//登录
- (NSString *)remoteLoginWithMobile:(NSString *)mobile andPassword:(NSString *)password;

//注册
- (BOOL)registerWithMobile:(NSString *)mobile Password:(NSString *)password AuthCode:(NSString *)autoCode andType:(NSString *)type;

//获取验证码
- (NSString *)getAuthCodeWithTel:(NSString *)tel;

//重置密码
- (BOOL)resetPasswordWithTel:(NSString *)tel NewPassword:(NSString *)newPassword andaAuthCode:(NSString *)authCode;

//获取人员信息
- (User *)getUserWithUserID:(NSString *)userId;

@end
