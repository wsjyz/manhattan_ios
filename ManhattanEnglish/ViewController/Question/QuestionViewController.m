//
//  QuestionViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()
{
    QuestionTableViewController *_quesTVC;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    switch (_quesType) {
        case QuesType_ques:
        {
            [self setNavgationItemTitle:@"我的问题"];
            break;
        }
        case QuesType_answer_assign:
        case QuesType_unAnswer:
        case QuesType_answered:
        {
            [self setNavgationItemTitle:@"我要回答"];
            break;
        }
        case QuesType_homeWork_Stu:
        case QuesType_homeWork_Tea:
        {
            [self setNavgationItemTitle:@"我的作业"];
            break;
        }
            
        default:
            break;
    }
    
    _quesTVC = [self.childViewControllers objectAtIndex:0];
    _quesTVC.quesType = self.quesType;
    [_quesTVC willBeginRefreshData];
    [_quesTVC refreshData];
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
