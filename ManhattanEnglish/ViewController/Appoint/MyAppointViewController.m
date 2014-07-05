//
//  MyAppointViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-18.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "MyAppointViewController.h"
#import "CourseTableViewController.h"
#import "CourseService.h"
#import "TeacherListTableViewController.h"
#import "MyStudentListTableViewController.h"
#import "AppointService.h"
#import "CommonService.h"
#import "Page.h"

@interface MyAppointViewController ()

@property (strong, nonatomic) Page *currCoursePage;
@property (strong, nonatomic) Page *currTeacherPage;

@property (strong, nonatomic) CommonService *commonService;
@property (strong, nonatomic) AppointService *appointService;
@property (strong, nonatomic) CourseService *courseService;
@property (assign, nonatomic) BOOL isAudition;

@property (weak, nonatomic) CourseTableViewController *courseTableViewCon;
@property (weak, nonatomic) TeacherListTableViewController *teacherTableViewCon;
@property (weak, nonatomic) MyStudentListTableViewController *studentTableViewCon;

@end

@implementation MyAppointViewController

- (void)initService
{
    self.commonService = [[CommonService alloc] init];
    self.courseService = [[CourseService alloc] initWithDelegate:self];
    self.appointService = [[AppointService alloc] initWithDelegate:self];
    
    self.currCoursePage = [[Page alloc] init];
    self.currCoursePage.autoCount = NO;
    self.currCoursePage.autoPaging = NO;
    
    self.currTeacherPage = [[Page alloc] init];
    self.currTeacherPage.autoCount = NO;
    self.currTeacherPage.autoPaging = NO;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    UITabBarItem *item = self.navigationController.tabBarItem;
    self.isAudition = [@"试听" isEqualToString:item.title];
    
    [self setNavgationItemTitle:self.isAudition? @"我的试听" : @"我的预约"];
    
    PERSONAL_ID currPersonId = [self.commonService currentPersonalID];
    BOOL isTeacher = currPersonId == PERSONAL_TEACHER;
    self.studentInnerVIew.hidden = !isTeacher;
    
    if (isTeacher) {
        [self refreshDataOfTeacher];
    }else{
        [self updateControlLayoutWithCurrentSegmentControlSelected];
        [self refreshDataOfStudent];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 刷新数据 （当前角色为老师）
- (void)refreshDataOfTeacher
{
    if (self.isAudition) {
        
        // 试听
        self.studentTableViewCon.stuType = Stu_type_listenStu;
        
    }else{
        
        // 预约
        self.studentTableViewCon.stuType = Stu_type_orderStu;
    }
    [self.studentTableViewCon willBeginRefreshData];
    [self.studentTableViewCon refreshData];
}

// 刷新数据 (当前角色为学生)
- (void)refreshDataOfStudent
{
    NSUInteger index = self.segmentedControl.selectedSegmentIndex;
    
    // course
    if (index == 0) {
        
        if (!self.isAudition) {
            
            self.courseTableViewCon.currPage = [self.appointService getOrderCoursesWithPage:self.currCoursePage andUserId:[self.commonService getCurrentUserID]];
        }else{
            
            self.courseTableViewCon.currPage = [self.appointService getListenCoursesWithPage:self.currCoursePage andUserId:[self.commonService getCurrentUserID]];
        }
    }else{
        
        if (self.isAudition)
        {
            //视听
            self.teacherTableViewCon.teacherType = Tea_type_listen;
        }
        else
        {
            //预约
            self.teacherTableViewCon.teacherType = Tea_type_order;
        }
        [self.teacherTableViewCon willBeginRefreshData];
        [self.teacherTableViewCon refreshData];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"innerCourse" isEqualToString:segue.identifier]) {
        
        CourseTableViewController *courseTableViewCon = [segue destinationViewController];
        self.courseTableViewCon = courseTableViewCon;
        
    }else if ([@"innerTeacher" isEqualToString:segue.identifier]) {
        
        TeacherListTableViewController *teacherTableViewCon = [segue destinationViewController];
        self.teacherTableViewCon = teacherTableViewCon;
    }else if ([@"innerStudent" isEqualToString:segue.identifier]) {
        
        MyStudentListTableViewController *studentTableViewCon = [segue destinationViewController];
        self.studentTableViewCon = studentTableViewCon;
    }
}

- (void)updateControlLayoutWithCurrentSegmentControlSelected
{
    NSUInteger index = self.segmentedControl.selectedSegmentIndex;
    self.courseInnerView.hidden = index == 1;
    self.teacherInnerView.hidden = index == 0;
}


- (IBAction)segmentValueChanged:(id)sender {
    
    [self updateControlLayoutWithCurrentSegmentControlSelected];
    
    [self refreshDataOfStudent];
}
@end
