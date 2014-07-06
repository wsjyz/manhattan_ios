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
#import "UserService.h"
#import "CommonService.h"
#import <TbcLibUI/UIImageView+WebCache.h>
#import "PersonalInfoViewController.h"

#define VALUE(a)                    a==nil?@"":a

@interface MyStudentListTableViewController ()
{
    Page *_currentPage;
    UserService *_userService;
    CommonService *_commonService;
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
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        __block Page *newPage;
        NSString *userID = [_commonService getCurrentUserID];
        switch (_stuType) {
            case Stu_type_myStu:
            {
                newPage = [_userService getStudentList:_currentPage TeacherID:userID];
                break;
            }
            case Stu_type_orderStu:
            {
                newPage = [_userService getOrderStudentList:_currentPage TeacherID:userID];
                break;
            }
            case Stu_type_listenStu:
            {
                newPage = [_userService getListenStudentList:_currentPage TeacherID:userID];
                break;
            }
                
            default:
                break;
        }
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
    
    _currentPage.pageNo = 1;
    _currentPage.rows = nil;
    _currentPage.autoCount = YES;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        __block Page *newPage;
        NSString *userID = [_commonService getCurrentUserID];
        switch (_stuType) {
            case Stu_type_myStu:
            {
                newPage = [_userService getStudentList:_currentPage TeacherID:userID];
                break;
            }
            case Stu_type_orderStu:
            {
                newPage = [_userService getOrderStudentList:_currentPage TeacherID:userID];
                break;
            }
            case Stu_type_listenStu:
            {
                newPage = [_userService getListenStudentList:_currentPage TeacherID:userID];
                break;
            }
                
            default:
                break;
        }
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
    
    return YES;
}

- (void)initService
{
    _userService = [[UserService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
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
    
    User *stu = _resourceArr[indexPath.row];
    cell.name.text = VALUE(stu.userName);
    [cell.headImg setImageWithURL:[NSURL URLWithString:stu.avatar] placeholderImage:nil];
    if ([stu.sex isEqualToString:SEX_MALE])
    {
        cell.sexImg.image = [UIImage imageNamed:@"personal_boy.png"];
    }
    else if ([stu.sex isEqualToString:SEX_FEMALE])
    {
        cell.sexImg.image = [UIImage imageNamed:@"personal_girl.png"];
    }
    else
    {
        cell.sexImg.hidden = YES;
    }
    cell.mobile.text = VALUE(stu.mobile);
    cell.address.text = VALUE(stu.address);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalInfoViewController *personInfoVC = [storyBoard instantiateViewControllerWithIdentifier:@"personInfo"];
    personInfoVC.personID = PERSONAL_STUDENT;
    personInfoVC.user = _resourceArr[indexPath.row];
    personInfoVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:personInfoVC animated:YES];
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
