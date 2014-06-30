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

@interface AnswerHomeWorkViewController : BaseViewController

@property (nonatomic, strong) HomeWork *homework;

- (IBAction)selectPic:(id)sender;
- (IBAction)submitHomework:(id)sender;

@end
