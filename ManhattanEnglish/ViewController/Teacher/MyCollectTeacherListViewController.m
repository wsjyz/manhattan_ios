//
//  MyCollectTeacherListViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "MyCollectTeacherListViewController.h"
#import "MyCollectTeacherListTableViewController.h"

@interface MyCollectTeacherListViewController ()
{
    MyCollectTeacherListTableViewController *_teacherListTVC;
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
    [self setNavgationItemTitle:@"我的收藏"];
    _teacherListTVC = [self.childViewControllers objectAtIndex:0];
    [_teacherListTVC willBeginRefreshData];
    [_teacherListTVC refreshData];
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
