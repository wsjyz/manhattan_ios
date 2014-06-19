//
//  TeacherHomeWorkViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherHomeWorkViewController.h"
#import "QuestionViewController.h"

@interface TeacherHomeWorkViewController ()
{
    QuestionViewController *_quesVC;
}

@end

@implementation TeacherHomeWorkViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的作业"];
    self.homeworkContent.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.homeworkContent.layer.borderWidth = 1;
    _quesVC = [self.childViewControllers objectAtIndex:0];
    _quesVC.quesType = QuesType_homeWork_Tea;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
