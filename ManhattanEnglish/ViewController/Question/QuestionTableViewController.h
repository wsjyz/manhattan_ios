//
//  QuestionTableViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum
{
    QuesType_ques = 0,
    QuesType_answer_assign = 1,   //指定回答
    QuesType_answered = 2,          //已回答
    QuesType_unAnswer = 3,          //未回答
    QuesType_homeWork_Stu = 4,
    QuesType_homeWork_Tea
}QuesType;

@interface QuestionTableViewController : BaseTableViewController

@property (nonatomic, assign) QuesType quesType;
@property (nonatomic, retain) Page *currentPage;

@end
