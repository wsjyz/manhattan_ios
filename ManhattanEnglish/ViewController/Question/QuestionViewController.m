//
//  QuestionViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuesTableViewCell.h"
#import "QuesDetailViewController.h"
#import "QuestionService.h"
#import "CommonService.h"
#import "AnswerHomeWorkViewController.h"

@interface QuestionViewController ()<QuesDetailDelegate>
{
    IBOutlet UITableView *_tableView;
    NSMutableArray *_resourceArr;
    QuestionService *_quesService;
    CommonService *_commonService;
}

@end

@implementation QuestionViewController

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
    _commonService = [[CommonService alloc] initWithDelegate:nil];
    _quesService = [[QuestionService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    switch (_quesType) {
        case 0:
        {
            [self setNavgationItemTitle:@"我的问题"];
            break;
        }
        case 1:
        case 2:
        {
            [self setNavgationItemTitle:@"我的作业"];
            break;
        }
            
        default:
            break;
    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.navigationController.view addSubview:hud];
    
    [hud showAnimated:YES whileExecutingBlock:^{
        switch (_quesType) {
            case 0:
            {
                _resourceArr = [NSMutableArray arrayWithArray:[_quesService myQuestionsWithUserId:[_commonService getCurrentUserID]]];
                break;
            }
            case 1:
            {
                //TODO:
                break;
            }
            case 2:
            {
                break;
            }
                
            default:
                break;
        }
        
    } completionBlock:^{
        if (_resourceArr && _resourceArr.count != 0)
        {
            [_tableView reloadData];
        }
        [hud removeFromSuperview];
    }];

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
    Question *ques = _resourceArr[indexPath.row];
    
    QuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuesTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[QuesTableViewCell class] owner:self];
    }
    cell.content.text = ques.questionTitle;
    [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), MAXFLOAT)];
    
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
        case 0:
        {
//            我的问题
            QuesDetailViewController *quesDetailVC = [ViewUtil viewControllerFromNibOfClass:[QuesDetailViewController class]];
            quesDetailVC.delegate = self;
            quesDetailVC.ques = _resourceArr[indexPath.row];
            [self.navigationController pushViewController:quesDetailVC animated:YES];
            break;
        }
        case 1:
        {
//            我的作业
            AnswerHomeWorkViewController *homwworkDetailVC = [ViewUtil viewControllerFromNibOfClass:[AnswerHomeWorkViewController class]];
            //TODO:
            [self.navigationController pushViewController:homwworkDetailVC animated:YES];
            break;
        }
            
        default:
            break;
    }
    
}

#pragma mark QuesDetailDelegate
- (void)deleteQuestion:(Question *)ques
{
    [_resourceArr removeObject:ques];
    [_tableView reloadData];
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
