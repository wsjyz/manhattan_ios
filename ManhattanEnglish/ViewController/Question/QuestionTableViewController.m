//
//  QuestionTableViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuestionTableViewController.h"
#import "QuesTableViewCell.h"
#import "QuesDetailViewController.h"
#import "QuestionService.h"
#import "CommonService.h"
#import "HomeworkService.h"
#import "AnswerHomeWorkViewController.h"

@interface QuestionTableViewController ()<QuesDetailDelegate,AnswerDelegate>
{
    QuestionService *_quesService;
    CommonService *_commonService;
    HomeworkService *_homeworkService;
}

@property (nonatomic, strong) NSMutableArray *resourceArr;

@end

@implementation QuestionTableViewController

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
        NSString *userID  = [_commonService getCurrentUserID];
        
        switch (_quesType) {
            case QuesType_ques:
            {
                newPage = [_quesService myQuestionsWithUserId:userID Page:_currentPage];
                break;
            }
            case QuesType_answer_assign:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_ASSIGN Page:_currentPage];
                break;
            }
            case QuesType_answered:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_ANSWER Page:_currentPage];
                break;
            }
            case QuesType_unAnswer:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_UNANSWER Page:_currentPage];
                break;
            }
            case QuesType_homeWork_Stu:
            {
                newPage = [_homeworkService getHomeworksByUserWithPage:_currentPage andUserID:userID];
                break;
            }
            case QuesType_homeWork_Tea:
            {
                newPage = [_homeworkService getHomeworksByTeacherWithPage:_currentPage andTeacherID:userID];
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
        NSString *userID  = [_commonService getCurrentUserID];
        
        switch (_quesType) {
            case QuesType_ques:
            {
                newPage = [_quesService myQuestionsWithUserId:userID Page:_currentPage];
                break;
            }
            case QuesType_answer_assign:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_ASSIGN Page:_currentPage];
                break;
            }
            case QuesType_answered:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_ANSWER Page:_currentPage];
                break;
            }
            case QuesType_unAnswer:
            {
                newPage = [_quesService needAnswerListWithUserId:userID Type:ANS_TYPE_UNANSWER Page:_currentPage];
                break;
            }
            case QuesType_homeWork_Stu:
            {
                newPage = [_homeworkService getHomeworksByUserWithPage:_currentPage andUserID:@"u1"];
                break;
            }
            case QuesType_homeWork_Tea:
            {
                newPage = [_homeworkService getHomeworksByTeacherWithPage:_currentPage andTeacherID:userID];
                break;
            }
                
            default:
                break;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (newPage != nil)
            {
                _currentPage = newPage;
                self.resourceArr = _currentPage.rows == nil ?  nil : _currentPage.rows;
                [self.tableView reloadData];
            }
            [self refreshDataComplete];
        });
    });
    
    return YES;
}

- (void)initService
{
    _commonService = [[CommonService alloc] initWithDelegate:nil];
    _quesService = [[QuestionService alloc] initWithDelegate:self];
    _homeworkService = [[HomeworkService alloc] initWithDelegate:self];
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

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _resourceArr == nil ? 0:_resourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuesTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[QuesTableViewCell class] owner:self];
    }
    
    switch (_quesType) {
        case QuesType_ques:
        case QuesType_answer_assign:
        case QuesType_answered:
        case QuesType_unAnswer:
        {
            Question *ques = _resourceArr[indexPath.row];
            cell.content.text = ques.questionTitle;
           break;
        }
        case QuesType_homeWork_Stu:
        case QuesType_homeWork_Tea:
        {
            HomeWork *homework = _resourceArr[indexPath.row];
            cell.content.text = homework.homeworkTitle;
            break;
        }
            
        default:
            break;
    }
    
    [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), MAXFLOAT)];
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (_quesType) {
        case QuesType_ques:
        case QuesType_answered:
        {
            //我的问题
            QuesDetailViewController *quesDetailVC = [ViewUtil viewControllerFromNibOfClass:[QuesDetailViewController class]];
            quesDetailVC.delegate = self;
            quesDetailVC.ques = _resourceArr[indexPath.row];
            [self.navigationController pushViewController:quesDetailVC animated:YES];
            break;
        }
        case QuesType_answer_assign:
        case QuesType_unAnswer:
        {
            //我的问题(未回答)
            AnswerHomeWorkViewController *homwworkDetailVC = [ViewUtil viewControllerFromNibOfClass:[AnswerHomeWorkViewController class]];
            homwworkDetailVC.question = _resourceArr[indexPath.row];
            homwworkDetailVC.isHomeWork = NO;
            homwworkDetailVC.delegate = self;
            [self.navigationController pushViewController:homwworkDetailVC animated:YES];
            break;
        }
        case QuesType_homeWork_Stu:
        {
            //我的作业
            AnswerHomeWorkViewController *homwworkDetailVC = [ViewUtil viewControllerFromNibOfClass:[AnswerHomeWorkViewController class]];
            homwworkDetailVC.isHomeWork = YES;
            homwworkDetailVC.delegate = self;
            homwworkDetailVC.homework = _resourceArr[indexPath.row];
            [self.navigationController pushViewController:homwworkDetailVC animated:YES];
            break;
        }
        case QuesType_homeWork_Tea:
        {
            break;
        }
            
        default:
            break;
    }
    
}

- (void)addHomework:(HomeWork *)hoemwork
{
    [_resourceArr insertObject:hoemwork atIndex:0];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark QuesDetailDelegate
- (void)deleteQuestion:(Question *)ques
{
    NSUInteger index = [_resourceArr indexOfObject:ques];
    [_resourceArr removeObjectAtIndex:index];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark AnswerDelegate
- (void)answerSuccessed:(id)sender
{
    NSUInteger index = [_resourceArr indexOfObject:sender];
    [_resourceArr removeObjectAtIndex:index];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
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
