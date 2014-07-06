//
//  TeacherListViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherListViewController.h"
#import "TeacherListTableViewController.h"

@interface TeacherListViewController ()<TeacherListTVCDelegate>
{
    TeacherListTableViewController *_listTVC;
}

@end

@implementation TeacherListViewController

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
    [self setNavgationItemTitle:@"名师列表"];
    _listTVC = [self.childViewControllers objectAtIndex:0];
    _listTVC.selectTeacher = self.selectTeacher;
    _listTVC.teacherType = Tea_type_all;
    [_listTVC willBeginRefreshData];
    [_listTVC refreshData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
    _listTVC.searchKey = searchBar.text;
    [_listTVC willBeginRefreshData];
    [_listTVC refreshData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    _listTVC.searchKey = nil;
    [searchBar resignFirstResponder];
}

#pragma mark TeacherListTVCDelegate
- (void)selectTeacherID:(NSString *)teacherID andTeacherName:(NSString *)name
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectTeacherID:andTeacherName:)])
    {
        [self.delegate selectTeacherWithTeacherID:teacherID andTeacherName:name];
    }
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
