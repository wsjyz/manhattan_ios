//
//  IndexViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-3.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface IndexViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginBtnItem;
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIButton *appoinBtn;
@property (weak, nonatomic) IBOutlet UIButton *qaBtn;

- (IBAction)appointBtnClick:(id)sender;
- (IBAction)goodCourseBtnClick:(id)sender;
- (IBAction)newsBtnClick:(id)sender;
- (IBAction)goodTeacherBtnClick:(id)sender;
- (IBAction)homeworkBtnClick:(id)sender;
- (IBAction)qaBtnClick:(id)sender;
- (IBAction)calendarBtnClick:(id)sender;
@end
