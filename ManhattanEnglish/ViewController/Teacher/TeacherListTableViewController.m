//
//  TeacherListTableViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-11.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherListTableViewController.h"
#import "TeacherMainCell.h"
#import "TeacherDetailViewController.h"
#import "TeacherService.h"
#import "Page.h"

@interface TeacherListTableViewController ()
{
    TeacherService *_teacherService;
    Page *_currentPage;
}

@end

@implementation TeacherListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initService
{
    _teacherService = [[TeacherService alloc] initWithDelegate:self];
}

- (BOOL)enableRefresh
{
    return YES;
}

- (BOOL)autoRefreshData
{
    return NO;
}

- (BOOL)enableLoadmore
{
    return YES;
}

- (BOOL)canLoadMore
{
    return _currentPage.hasNextPage;
}

- (BOOL)loadMore
{
    if (![super loadMore])
    {
        return NO;
    }
    
    _currentPage.autoCount = NO;
    _currentPage.rows = nil;
    _currentPage.pageNo ++;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        __block Page *newPage = [_teacherService listPageWithPage:_currentPage];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (newPage != nil)
            {
                _currentPage = newPage;
                [self.resourceArr addObjectsFromArray:_currentPage.rows];
                [self.tableView reloadData];
            }
            [self loadMoreCompleted];
        });
    });
    
    return YES;
}

- (BOOL)refreshData
{
    if (![super refreshData]) {
        return NO;
    }
    
    if (_searchKey!= nil && _searchKey.length != 0)
    {
        //搜索
        _currentPage = nil;
        _currentPage = [[Page alloc] init];
        _resourceArr = [NSMutableArray arrayWithArray:[_teacherService listByNameWithSearchKey:_searchKey]];
        [self.tableView reloadData];
        [self refreshDataComplete];
    }
    else
    {
        _currentPage.pageNo = 1;
        _currentPage.rows = nil;
        _currentPage.autoCount = YES;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            __block Page *newPage = [_teacherService listPageWithPage:_currentPage];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (newPage != nil)
                {
                    _currentPage = newPage;
                    self.resourceArr = _currentPage.rows;
                    [self.tableView reloadData];
                }
                [self refreshDataComplete];
            });
        });

    }
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherDetailViewController *teacherDetailVC = [ViewUtil viewControllerFromNibOfClass:[TeacherDetailViewController class]];
    [self.navigationController pushViewController:teacherDetailVC animated:YES];
}

@end
