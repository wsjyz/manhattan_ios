//
//  AnswerHomeWorkViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeWork.h"
#import "HomeworkSubmit.h"
#import "Question.h"

@protocol AnswerDelegate <NSObject>

- (void)answerSuccessed:(id)sender;

@end

@interface AnswerHomeWorkViewController : BaseViewController

@property (nonatomic, strong) HomeWork *homework;
@property (nonatomic, strong) Question *question;
@property (nonatomic, assign) BOOL isHomeWork;
@property (nonatomic, weak) id<AnswerDelegate> delegate;

- (IBAction)selectPic:(id)sender;
- (IBAction)submitHomework:(id)sender;

@end
