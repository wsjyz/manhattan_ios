//
//  OpenQuestionService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-10.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "Question.h"
#import "Page.h"

@interface OpenQuestionService : BaseRestService

/**
 * 提问
 * @param question
 * @return Boolean
 */
- (BOOL)askQuestionWithQuestion:(Question *)ques FileData:(NSData *)data FileName:(NSString *)fileName;

/**
 * 回答问题
 * @param question
 * @return Boolean
 */
- (BOOL)answerQuestionWithQuestion:(Question *)ques FileData:(NSData *)data FileName:(NSString *)fileName;

/**
 * 删除问答
 * @param questionId
 */
- (BOOL)deleteQuestionWithQuestionId:(NSString *)questionId;

/**
 * 获取我的问题
 *
 * @param userId
 * @param page
 * @return Page<Question>
 */
- (Page *)myQuestionsWithUserId:(NSString *)userId Page:(Page *)page;

/**
 * 获取需要回答列表
 *
 * @param userId
 * @param page
 * @param type （指定回答(ASSIGN)；已回答(ANSWER)；未回答(UNANSWER)）
 * @return Page<Question>（rows 是包含question 对象的数组）
 */
- (Page *)needAnswerListWithUserId:(NSString *)userId Type:(NSString *)type Page:(Page *)page;

@end
