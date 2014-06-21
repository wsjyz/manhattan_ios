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
    QuesType_homeWork_Stu = 1,
    QuesType_homeWork_Tea
}QuesType;

@interface QuestionTableViewController : BaseTableViewController

@property (nonatomic, assign) QuesType quesType;

@end
