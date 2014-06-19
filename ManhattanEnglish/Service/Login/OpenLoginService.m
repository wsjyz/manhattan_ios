//
//  OpenLoginService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-25.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenLoginService.h"

@implementation OpenLoginService

/**
 * 登录
 * @param mobile
 * @param password
 * @return userId
 */
- (User *)remoteLoginWithMobile:(NSString *)mobile andPassword:(NSString *)password
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     mobile, @"mobile",
                                     password, @"password",nil];
    return [RestServiceManager performRequestWithPath:OpenLoginService_login paramDic:paramDic returnType:NSStringFromClass([User class]) delegate:self.delegate];
}

/**
 * 注册
 * @param mobile
 * @param password
 * @param authCode
 * @param type
 * @return
 */
- (BOOL)registerWithMobile:(NSString *)mobile Password:(NSString *)password AuthCode:(NSString *)autoCode andType:(NSString *)type
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     mobile, @"mobile",
                                     password, @"password",
                                     autoCode, @"autoCode",
                                     type, @"type",nil];
    return [[RestServiceManager performRequestWithPath:OpenLoginService_register paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

/**
 * 获取验证码
 * @param tel
 * @return String
 */
- (NSString *)getAuthCodeWithTel:(NSString *)tel;
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     tel, @"tel",nil];
    return [RestServiceManager performRequestWithPath:OpenLoginService_authCode paramDic:paramDic returnType:NSStringFromClass([NSString class]) delegate:self.delegate];
}

/**
 * 重置密码
 * @param tel
 * @param newPassword
 * @param authCode
 * @return
 */
- (BOOL)resetPasswordWithTel:(NSString *)tel NewPassword:(NSString *)newPassword andaAuthCode:(NSString *)authCode
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     tel, @"tel",
                                     newPassword, @"newPassword",
                                     authCode, @"authCode",nil];
    return [[RestServiceManager performRequestWithPath:OpenLoginService_resetPW paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}


@end
