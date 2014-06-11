//
//  QuesDetailViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuesDetailViewController.h"
#import "QuesDetailTableViewCell.h"
#import <TbcLibUI/UIImageView+WebCache.h>
#import "QuestionService.h"

@interface QuesDetailViewController ()
{
    IBOutlet UITableView *_tableView;
    QuestionService *_quesService;
}

@end

@implementation QuesDetailViewController

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
    _quesService = [[QuestionService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的问题"];
    
    UIButton *coustomButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [coustomButton setBackgroundImage:[UIImage imageNamed:@"nav_bar_red_btn_n.png"] forState:UIControlStateNormal];
    [coustomButton setBackgroundImage:[UIImage imageNamed:@"nav_bar_red_btn_p.png"] forState:UIControlStateHighlighted];
    [coustomButton setImage:[UIImage imageNamed:@"nav_bar_del_btn_n.png"] forState:UIControlStateNormal];
    [coustomButton addTarget:self action:@selector(rightBtnPressed)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithCustomView:coustomButton];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)rightBtnPressed
{
    BOOL result = [_quesService deleteQuestionWithQuestionId:_ques.questionId];
    if (result)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(deleteQuestion:)])
        {
            [self.delegate deleteQuestion:_ques];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
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
    if (indexPath.row == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
            cell.backgroundColor = [UIColor clearColor];
        }
        return cell;
    }
    
    QuesDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuesDetailTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[QuesDetailTableViewCell class] owner:self];
    }
    if (indexPath.row == 0)
    {
        cell.quesTypeLabel.text = @"问题";
        cell.timeLabel.text = [ViewUtil timeAllStrWithDate:_ques.createTime];
        cell.content.text = _ques.questionContent;
        if (_ques.questionPic != nil && _ques.questionPic.length != 0)
        {
            [cell.contentImg setImageWithURL:[NSURL URLWithString:_ques.questionPic] placeholderImage:nil];
        }
        cell.answerTeacher.hidden = YES;
        cell.answerName.hidden = YES;
    }
    else
    {
        cell.quesTypeLabel.text = @"解答";
        cell.timeLabel.text = [ViewUtil timeAllStrWithDate:_ques.answerTime];
        cell.content.text = _ques.answer;
        if (_ques.answerPic != nil && _ques.answerPic.length != 0)
        {
            [cell.contentImg setImageWithURL:[NSURL URLWithString:_ques.answerPic] placeholderImage:nil];
        }
        cell.answerTeacher.hidden = NO;
        cell.answerName.hidden = NO;
        cell.answerName.text = _ques.replyUser;
    }
    
    [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), MAXFLOAT)];
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1)
    {
        return 10;
    }
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
