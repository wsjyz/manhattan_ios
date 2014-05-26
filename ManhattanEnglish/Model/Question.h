//
//  Question.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-26.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, retain) NSString *questionId;
@property (nonatomic, retain) NSString *questionTitle;  //标题
@property (nonatomic, retain) NSString *questionContent;    //内容
@property (nonatomic, retain) NSString *questionPic;    //问题图片
@property (nonatomic, retain) NSString *userId;     //提问人
@property (nonatomic, retain) NSString *replyUser;  //回答人
@property (nonatomic, retain) NSString *assignTeacher;  //指定回答教师
@property (nonatomic, retain) NSString *status;     //问题状态
@property (nonatomic, retain) NSString *answer;     //问题答案
@property (nonatomic, retain) NSDate *createTime;   //问题创建时间
@property (nonatomic, retain) NSDate *answerTime;   //问题回答时间

@end
