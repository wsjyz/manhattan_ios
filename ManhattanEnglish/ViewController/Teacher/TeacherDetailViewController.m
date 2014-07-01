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
#import "AuditionDetailViewController.h"
#import <TbcLibUI/UIImageView+WebCache.h>

#define VALUE(a)                        a==nil?@"":a

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
    User *user = _teacherDetail.user;
    NSUInteger row = indexPath.row;
    if (row == 0)
    {
        TeacherMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherMainCell"];
        if (cell == nil)
        {
            cell = [ViewUtil viewFromNibOfClass:[TeacherMainCell class] owner:self];
            cell.arrowImg.hidden = YES;
        }
        cell.name.text = VALUE(user.userName);
        if (user.avatar)
        {
            cell.headImg.image = [UIImage imageNamed:[NSURL URLWithString:user.avatar]];
        }
        if (user.sex && [user.sex isEqualToString:SEX_MALE])
        {
            cell.sexImg.image = [UIImage imageNamed:@"personal_boy.png"];
        }
        else if (user.sex && [user.sex isEqualToString:SEX_FEMALE])
        {
            cell.sexImg.image = [UIImage imageNamed:@"personal_girl.png"];
        }
        else
        {
            cell.sexImg.hidden = YES;
        }
        cell.school.text = VALUE(_teacherDetail.finalGraduateSchool);
        cell.subject.text = VALUE(_teacherDetail.course_category);
        
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
        
        cell.score.text = VALUE(_teacherDetail.expertScore);
        cell.commentContent.text = VALUE(_teacherDetail.expertComments);
        cell.area.text = VALUE(_teacherDetail.teachingArea);
        cell.mode.text = VALUE(_teacherDetail.tutoringWay);
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
        for (int i = 0 ; i<_teacherDetail.teachingTime.length ; i++)
        {
            int day = i/3;
            int index = i%3;
            unichar timeChar = [_teacherDetail.teachingTime characterAtIndex:i];
        }
//        [timeList enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//            CourseSchedule *schedule = obj;
//            ScheduleView *view = cell.scheduleArr[idx];
//            [view showForeBtn:schedule.forenoon];
//            [view showAfterBtn:schedule.afternoon];
//            [view showAfterSixBtn:schedule.aftersix];
//        }];
        
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
