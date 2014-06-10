//
//  User.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-24.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *mobile; //手机号
@property (nonatomic, strong) NSString *userName; //姓名
@property (nonatomic, strong) NSString *password; //登录密码
@property (nonatomic, strong) NSString *authCode; //验证码
@property (nonatomic, strong) NSString *type; //人员类型（TEACHER;STUDENT;VIPSTUDENT）
@property (nonatomic, strong) NSString * avatar; //头像url
@property (nonatomic, strong) NSString * sex; //性别(MALE;FEMALE)
@property (nonatomic, strong) NSString * email; //邮箱
@property (nonatomic, strong) NSString * address; //地址
@property (nonatomic, assign) NSInteger credits; //积分
@property (nonatomic, assign) NSUInteger wallet; //钱包余额
@property (nonatomic, strong) NSDate *vipExpiredTime; //vip到期时间
@property (nonatomic, strong) NSString *evaluation;   //评价

@end
