//
//  Question.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-26.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Question : NSObject

@property (nonatomic, strong) NSString *questionId;
@property (nonatomic, strong) NSString *questionTitle;  //标题
@property (nonatomic, strong) NSString *questionContent;    //内容
@property (nonatomic, strong) NSString *questionPic;    //问题图片
@property (nonatomic, strong) NSString *userId;     //提问人
@property (nonatomic, strong) NSString *replyUser;  //回答人
@property (nonatomic, strong) NSString *assignTeacher;  //指定回答教师
@property (nonatomic, strong) NSString *status;     //问题状态
@property (nonatomic, strong) NSString *answer;     //问题答案
@property (nonatomic, strong) NSString *answerPic;
@property (nonatomic, strong) NSDate *createTime;   //问题创建时间
@property (nonatomic, strong) NSDate *answerTime;   //问题回答时间
@property (nonatomic, strong) User *askUser;
@property (nonatomic, strong) User *repUser;

@end
