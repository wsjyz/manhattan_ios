//
//  MyCollectTeacherListViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "MyCollectTeacherListViewController.h"
#import "TeacherListTableViewController.h"
#import "MyStudentListTableViewController.h"

@interface MyCollectTeacherListViewController ()
{
    TeacherListTableViewController *_teacherListTVC;
    MyStudentListTableViewController *_studentListTVC;
}

@end

@implementation MyCollectTeacherListViewController

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
    [self setNavgationItemTitle:self.isCollectTeacher?@"我的收藏":@"我的学生"];
    self.navigationItem.leftBarButtonItem = nil;
    
    if (self.isCollectTeacher)
    {
        _collectInnerView.hidden = NO;
        _studentInnerView.hidden = YES;
        
        _teacherListTVC = [self.childViewControllers objectAtIndex:0];
        _teacherListTVC.view.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-BAR_HEIGHT-TAB_BAR_HEIGHT);
        _teacherListTVC.teacherType = Tea_type_Collect;
        [_teacherListTVC willBeginRefreshData];
        [_teacherListTVC refreshData];
    }
    else
    {
        _collectInnerView.hidden = YES;
        _studentInnerView.hidden = NO;
        
        _studentListTVC = [self.childViewControllers objectAtIndex:1];
        _studentListTVC.view.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT-BAR_HEIGHT-TAB_BAR_HEIGHT);
        _studentListTVC.stuType = Stu_type_myStu;
        [_studentListTVC willBeginRefreshData];
        [_studentListTVC refreshData];
    }
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
