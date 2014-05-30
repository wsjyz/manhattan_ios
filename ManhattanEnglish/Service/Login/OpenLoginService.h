//
//  OpenLoginService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-25.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRestService.h"
#import "User.h"

@interface OpenLoginService : BaseRestService

/**
 * 登录
 * @param mobile
 * @param password
 * @return userId
 */
- (NSString *)remoteLoginWithMobile:(NSString *)mobile andPassword:(NSString *)password;

/**
 * 注册
 * @param mobile
 * @param password
 * @param authCode
 * @param type
 * @return
 */
- (BOOL)registerWithMobile:(NSString *)mobile Password:(NSString *)password AuthCode:(NSString *)autoCode andType:(NSString *)type;

/**
 * 获取验证码
 * @param tel
 * @return String
 */
- (NSString *)getAuthCodeWithTel:(NSString *)tel;

/**
 * 重置密码
 * @param tel
 * @param newPassword
 * @param authCode
 * @return
 */
- (BOOL)resetPasswordWithTel:(NSString *)tel NewPassword:(NSString *)newPassword andaAuthCode:(NSString *)authCode;


@end
