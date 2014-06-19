//
//  MyStudentListTableViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "MyStudentListTableViewController.h"
#import "Page.h"
#import "StudentMainCell.h"

@interface MyStudentListTableViewController ()
{
    Page *_currentPage;
}
@property (nonatomic, strong) NSMutableArray *resourceArr;

@end

@implementation MyStudentListTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        __block Page *newPage = [_teacherService listPageWithPage:_currentPage];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (newPage != nil)
//            {
//                _currentPage = newPage;
//                [self.resourceArr addObjectsFromArray:_currentPage.rows];
//                [self.tableView reloadData];
//            }
//            [self loadMoreCompleted];
//        });
//    });
    
    return YES;
}

- (BOOL)refreshData
{
    if (![super refreshData]) {
        return NO;
    }
    
    _currentPage.pageNo = 1;
    _currentPage.rows = nil;
    _currentPage.autoCount = YES;
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        __block Page *newPage = [_teacherService listPageWithPage:_currentPage];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (newPage != nil)
//            {
//                _currentPage = newPage;
//                self.resourceArr = _currentPage.rows;
//                [self.tableView reloadData];
//            }
//            [self refreshDataComplete];
//        });
//    });
    
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _currentPage = [[Page alloc] init];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.resourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentMainCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[StudentMainCell class] owner:self];
    }
    cell.name.text = @"cafei";
    
    return cell;
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
