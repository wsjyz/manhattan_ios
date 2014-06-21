//
//  QuestionService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "Question.h"
#import "Page.h"
#import "OpenQuestionService.h"

@interface QuestionService : BaseRestService

//提问
- (Question *)askQuestionWithQuestion:(Question *)ques;

//回答问题
- (BOOL)answerQuestionWithQuestion:(Question *)ques;

//删除问答
- (BOOL)deleteQuestionWithQuestionId:(NSString *)questionId;

//获取我的问题
- (Page *)myQuestionsWithUserId:(NSString *)userId Page:(Page *)page;

//获取需要回答列表
- (Page *)needAnswerListWithUserId:(NSString *)userId Type:(NSString *)type Page:(Page *)page;


@end
