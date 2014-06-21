//
//  TeacherDetailViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherDetailViewController.h"
#import "TeacherMainCell.h"
#import "TeacherCommentTableViewCell.h"
#import "TeacherScheduleTableViewCell.h"
#import "TeacherChargeTableViewCell.h"
#import "TeacherPersonInfoTableViewCell.h"
#import "CourseSchedule.h"
#import "AuditionDetailViewController.h"

@interface TeacherDetailViewController ()<TeaCommentCellDelegate>

@end

@implementation TeacherDetailViewController

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
    [self setNavgationItemTitle:@"名师资料"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = indexPath.row;
    if (row == 0)
    {
        TeacherMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherMainCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherMainCell class] owner:self];
            cell.arrowImg.hidden = YES;
        }
        cell.name.text = @"cafei";
        
        return cell;
    }
    else if (row == 1)
    {
        //专家点评
        TeacherCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherCommentTableViewCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherCommentTableViewCell class] owner:self];
            cell.delegate = self;
        }
        
        cell.score.text = @"85分";
        cell.commentContent.text = @"该老师从业时间长，业务精湛，堪称教师中的典范，收费低，回报高，是你不二的选择";
        cell.area.text = @"黄浦区，徐汇区";
        cell.mode.text = @"教师上门";
        cell.concernNum.text = @"10";
        cell.commentNum.text = @"12";
        cell.collectNum.text = @"14";
        
        [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), MAXFLOAT)];
        
        return cell;
    }
    else if (row == 2)
    {
        //授课时间
        TeacherScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherScheduleTableViewCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherScheduleTableViewCell class] owner:self];
            cell.enable = NO;
        }
        //TODO:
        NSArray *list ;
        [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            CourseSchedule *schedule = obj;
            ScheduleView *view = cell.scheduleArr[idx];
            [view showForeBtn:schedule.forenoon];
            [view showAfterBtn:schedule.afternoon];
            [view showAfterSixBtn:schedule.aftersix];
        }];
        
        return cell;
    }
    else if (row == 3)
    {
        //课程收费
        TeacherChargeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherChargeTableViewCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherChargeTableViewCell class] owner:self];
        }
        
        return cell;
    }
    else
    {
        //自我介绍
        TeacherPersonInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherPersonInfoTableViewCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherPersonInfoTableViewCell class] owner:self];
        }
        
        cell.content.text = @"阳光自信的老师，高中在澳大利亚墨尔本学习，在新西兰进修4年儿童教育，擅长口语交流和基本书写，会用西式教育方式培养孩子口语、单词、发音，从娱乐中培养孩子技能，对孩子有耐心、爱心";
        
        [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), MAXFLOAT)];
        return cell;
    }
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row  = [indexPath row];
    CGFloat height = 0;
    if (row == 0)
    {
        height = 70;
    }
    else if (row == 2)
    {
        //授课时间
        height = 241;
    }
    else
    {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        height = cell.frame.size.height;
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark TeaCommentCellDelegate

- (void)toAuditionDetailController:(BOOL)isAudition
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AuditionDetailViewController *auditionViewCon = [storyboard instantiateViewControllerWithIdentifier:@"auditionDetail"];
    auditionViewCon.isAudition = isAudition;
    auditionViewCon.isTeacher = YES;
    [self.navigationController pushViewController:auditionViewCon animated:YES];
}

//试听
- (void)selectListenBtn
{
    [self toAuditionDetailController:YES];
}

//预约
- (void)selectOrderBtn
{
    [self toAuditionDetailController:NO];
}

//收藏
- (void)selectCollectBtn
{
    
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
