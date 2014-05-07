//
//  TeacherListViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherListViewController.h"
#import "TeacherMainCell.h"
#import "TeacherDetailViewController.h"

@interface TeacherListViewController ()

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherMainCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[TeacherMainCell class] owner:self];
    }
    cell.name.text = @"cafei";
    
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherDetailViewController *teacherDetailVC = [ViewUtil viewControllerFromNibOfClass:[TeacherDetailViewController class]];
    [self.navigationController pushViewController:teacherDetailVC animated:YES];
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
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
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
