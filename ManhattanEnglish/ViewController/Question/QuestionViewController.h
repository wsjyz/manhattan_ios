//
//  QuestionViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

typedef enum
{
    QuesType_ques = 0,
    QuesType_homeWork_Stu = 1,
    QuesType_homeWork_Tea
}QuesType;

@interface QuestionViewController : BaseViewController

@property (nonatomic, assign) QuesType quesType;

@end
