//
//  TeacherAnswerQuestionViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherAnswerQuestionViewController.h"

@interface TeacherAnswerQuestionViewController ()
{
    QuestionTableViewController *_quesTVC1;
    QuestionTableViewController *_quesTVC2;
    QuestionTableViewController *_quesTVC3;
}

@end

@implementation TeacherAnswerQuestionViewController

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
    
    [self setNavgationItemTitle:@"我要回答"];
    
    _quesTVC1 = [self.childViewControllers objectAtIndex:0];
    _quesTVC1.quesType = QuesType_answer_assign;
    _quesTVC2 = [self.childViewControllers objectAtIndex:1];
    _quesTVC2.quesType = QuesType_answered;
    _quesTVC3 = [self.childViewControllers objectAtIndex:2];
    _quesTVC3.quesType = QuesType_unAnswer;
    
    [_quesTVC1 willBeginRefreshData];
    [_quesTVC1 refreshData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)select:(id)sender
{
    UISegmentedControl *segmentControl = (UISegmentedControl *)sender;
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
        {
            //指定回答
            if (_quesTVC1.currentPage.rows == nil || _quesTVC1.currentPage.rows.count == 0)
            {
                [_quesTVC1 willBeginRefreshData];
                [_quesTVC1 refreshData];
            }
            break;
        }
        case 1:
        {
            //已回答
            if (_quesTVC2.currentPage.rows == nil || _quesTVC2.currentPage.rows.count == 0)
            {
                [_quesTVC2 willBeginRefreshData];
                [_quesTVC2 refreshData];
            }
            break;
        }
        case 2:
        {
            //未回答
            if (_quesTVC3.currentPage.rows == nil || _quesTVC3.currentPage.rows.count == 0)
            {
                [_quesTVC3 willBeginRefreshData];
                [_quesTVC3 refreshData];
            }
            break;
        }
            
        default:
            break;
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
