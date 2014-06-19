//
//  AskQuestionViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface AskQuestionViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UITextField *quesTitle;
@property (nonatomic, weak) IBOutlet UITextView *quesContent;
@property (nonatomic, weak) IBOutlet UILabel *imgName;
@property (nonatomic, weak) IBOutlet UILabel *teacherName;
@property (nonatomic, weak) IBOutlet UIButton *selectTeacherBtn;

- (IBAction)selectImg:(id)sender;
- (IBAction)sendQuestion:(id)sender;

@end
