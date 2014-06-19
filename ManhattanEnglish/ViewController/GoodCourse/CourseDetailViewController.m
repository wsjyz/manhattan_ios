//
//  CourseDetailViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "TeacherMainCell.h"
#import "Course.h"
#import "TeacherDetail.h"
#import "CourseHeaderView.h"
#import "CourseFooterView.h"
#import <TbcLibCore/CommonUtil.h>
#import <TbcLibUI/UIImageView+WebCache.h>
#import "AuditionDetailViewController.h"

@interface CourseDetailViewController () <UITableViewDataSource, UITableViewDelegate, AuditionDetailDelegate>

@end

@implementation CourseDetailViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toAuditionDetailController:(BOOL)isAudition
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AuditionDetailViewController *auditionViewCon = [storyboard instantiateViewControllerWithIdentifier:@"auditionDetail"];
    auditionViewCon.isAudition = isAudition;
    [self.navigationController pushViewController:auditionViewCon animated:YES];
}

- (void)appointBtnClick
{
    [self toAuditionDetailController:NO];
}

- (void)auditionBtnClick
{
    [self toAuditionDetailController:YES];
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
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 280;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 120;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CourseHeaderView *headerView = [ViewUtil viewFromNibOfClass:[CourseHeaderView class] owner:self];
    headerView.delegate = self;
    [headerView.courseImageView setImageWithURL:[NSURL URLWithString:self.course
                                                 .coursePic] placeholderImage:[UIImage imageNamed:@"good_course_cover_bg.png"]];
    headerView.classNoLabel.text = self.course.courseTitle;
    headerView.priceLabel.text = [NSString stringWithFormat:@"%0.0f RMB", self.course.expense];
    headerView.subTitleLabel.text = self.course.courseSubtitle;
    headerView.startDateLabel.text = [CommonUtil stringWithDate:self.course.startTime andFormatStr:yyyy_MM_dd];
    headerView.endDateLabel.text = [CommonUtil stringWithDate:self.course.endTime andFormatStr:yyyy_MM_dd];
    headerView.placeLabel.text = self.course.place;
    headerView.periodLabel.text = [NSString stringWithFormat:@"%0.1f", self.course.period];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CourseFooterView *footerView = [ViewUtil viewFromNibOfClass:[CourseFooterView class] owner:self];
    footerView.courseContentLabel.text = self.course.courseIntro;
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [ViewUtil viewFromNibOfClass:[TeacherMainCell class] owner:self];
    }
    
    // Configure the cell...
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:self];
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
