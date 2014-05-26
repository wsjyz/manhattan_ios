//
//  User.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-24.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *mobile; //手机号
@property (nonatomic, retain) NSString *userName; //姓名
@property (nonatomic, retain) NSString *password; //登录密码
@property (nonatomic, retain) NSString *authCode; //验证码
@property (nonatomic, retain) NSString *type; //人员类型（TEACHER;STUDENT;VIPSTUDENT）
@property (nonatomic, retain) NSString * avatar; //头像url
@property (nonatomic, retain) NSString * sex; //性别
@property (nonatomic, retain) NSString * email; //邮箱
@property (nonatomic, retain) NSString * address; //地址
@property (nonatomic, assign) NSInteger credits; //积分
@property (nonatomic, assign) NSUInteger wallet; //钱包余额
@property (nonatomic, retain) NSDate *vipExpiredTime; //vip到期时间


@end
