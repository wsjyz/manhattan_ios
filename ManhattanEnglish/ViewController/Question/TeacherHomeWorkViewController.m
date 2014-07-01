//
//  TeacherHomeWorkViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherHomeWorkViewController.h"
#import "QuestionTableViewController.h"
#import "HomeworkService.h"
#import "CommonService.h"

@interface TeacherHomeWorkViewController ()
{
    QuestionTableViewController *_quesTVC;
    HomeworkService *_homeworkService;
    CommonService *_commonService;
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

- (void)initService
{
    _homeworkService = [[HomeworkService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的作业"];    
    self.homeworkContent.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.homeworkContent.layer.borderWidth = 1;
    _quesTVC = [self.childViewControllers objectAtIndex:0];
    _quesTVC.quesType = QuesType_homeWork_Tea;
    [_quesTVC willBeginRefreshData];
    [_quesTVC refreshData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendHomework:(id)sender
{
    if (self.homeworkContent.text == nil || self.homeworkContent.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"发布内容不能为空" delegate:nil];
        return;
    }
    
    HomeWork *homework = [[HomeWork alloc] init];
    homework.homeworkTitle = self.homeworkContent.text;
    homework.teacherId = [_commonService getCurrentUserID];
    
    [_homeworkService postHomeWork:homework];
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
