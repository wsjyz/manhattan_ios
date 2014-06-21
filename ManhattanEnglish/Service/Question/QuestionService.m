//
//  QuestionService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuestionService.h"

@interface QuestionService ()
{
    OpenQuestionService *_quesService;
}

@end

@implementation QuestionService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _quesService = [[OpenQuestionService alloc] initWithDelegate:delegate];
    }
    return self;
}

//提问
- (Question *)askQuestionWithQuestion:(Question *)ques
{
    return [_quesService askQuestionWithQuestion:ques];
}

//回答问题
- (BOOL)answerQuestionWithQuestion:(Question *)ques
{
    return [_quesService answerQuestionWithQuestion:ques];
}

//删除问答
- (BOOL)deleteQuestionWithQuestionId:(NSString *)questionId
{
    return [_quesService deleteQuestionWithQuestionId:questionId];
}

//获取我的问题
- (Page *)myQuestionsWithUserId:(NSString *)userId Page:(Page *)page
{
    return [_quesService myQuestionsWithUserId:userId Page:page];
}

//获取我的问题
- (Page *)needAnswerListWithUserId:(NSString *)userId Type:(NSString *)type Page:(Page *)page
{
    return [_quesService needAnswerListWithUserId:userId Type:type Page:page];
}


@end
