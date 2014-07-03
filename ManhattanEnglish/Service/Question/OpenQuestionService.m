//
//  OpenQuestionService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenQuestionService.h"

@implementation OpenQuestionService

/**
 * 提问
 * @param question
 * @return Boolean
 */
-  (BOOL)askQuestionWithQuestion:(Question *)ques FileData:(NSData *)data FileName:(NSString *)fileName
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(ques), @"question",nil];
    return [[RestServiceManager performRequestWithPath:OpenQuestionService_askQuestion paramDic:paramDic returnType:NSStringFromClass([NSNumber class]) withFileData:data andFileName:fileName delegate:self.delegate] boolValue];
}

/**
 * 回答问题
 * @param question
 * @return Boolean
 */
- (BOOL)answerQuestionWithQuestion:(Question *)ques
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(ques), @"question", nil];
    return [[RestServiceManager performRequestWithPath:OpenQuestionService_answerQuestion paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

/**
 * 删除问答
 * @param questionId
 */
- (BOOL)deleteQuestionWithQuestionId:(NSString *)questionId
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     questionId, @"questionId", nil];
    return [[RestServiceManager performRequestWithPath:OpenQuestionService_deleteQuestion paramDic:paramDic returnType:@(@encode(BOOL)) delegate:self.delegate] boolValue];
}

/**
 * 获取我的问题
 *
 * @param userId
 * @param page
 * @return Page<Question>
 */
- (Page *)myQuestionsWithUserId:(NSString *)userId Page:(Page *)page
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userId, @"userId",
                                     OPENVALUE(page), @"openPage",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Question class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenQuestionService_myQuestions paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

/**
 * 获取需要回答列表
 *
 * @param userId
 * @param page
 * @param type （指定回答(ASSIGN)；已回答(ANSWER)；未回答(UNANSWER)）
 * @return Page<Question>（rows 是包含question 对象的数组）
 */
- (Page *)needAnswerListWithUserId:(NSString *)userId Type:(NSString *)type Page:(Page *)page
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userId, @"userId",
                                     type, @"type",
                                     OPENVALUE(page), @"openPage",nil];
    [ReflectionUtil setArrayType:NSStringFromClass([Question class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:OpenQuestionService_needAnswerList paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

@end
