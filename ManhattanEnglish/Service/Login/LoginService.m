//
//  LoginService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-25.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "LoginService.h"

@interface LoginService ()
{
    OpenLoginService *_loginService;
}

@end

@implementation LoginService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _loginService = [[OpenLoginService alloc] initWithDelegate:delegate];
    }
    return self;
}

//登录
- (NSString *)remoteLoginWithMobile:(NSString *)mobile andPassword:(NSString *)password
{
    return [_loginService remoteLoginWithMobile:mobile andPassword:password];
}

//注册
- (BOOL)registerWithMobile:(NSString *)mobile Password:(NSString *)password AuthCode:(NSString *)autoCode andType:(NSString *)type
{
    return [_loginService registerWithMobile:mobile Password:password AuthCode:autoCode andType:type];
}

//获取验证码
- (NSString *)getAuthCodeWithTel:(NSString *)tel
{
    return [_loginService getAuthCodeWithTel:tel];
}

//重置密码
- (BOOL)resetPasswordWithTel:(NSString *)tel NewPassword:(NSString *)newPassword andaAuthCode:(NSString *)authCode
{
    return [_loginService resetPasswordWithTel:tel NewPassword:newPassword andaAuthCode:authCode];
}

//获取人员信息
- (User *)getUserWithUserID:(NSString *)userId
{
    return [_loginService getUserWithUserID:userId];
}

@end
