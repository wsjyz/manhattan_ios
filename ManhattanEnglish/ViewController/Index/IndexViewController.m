//
//  IndexViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-3.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "IndexViewController.h"
#import "PageContentViewController.h"
#import "CommonService.h"
#import "Kal.h"
#import "NSDate+Convenience.h"
#import "CourseService.h"
#import "NewsService.h"
#import "CourseTableViewController.h"
#import "NewsTableViewController.h"

#define MANUAL_SEGUE_LOGIN                  @"login"
#define MANUAL_SEGUE_GOOD_COURSE            @"goodCourse"
#define MANUAL_SEGUE_ASK_QUESTION           @"askQuestion"
#define MANUAL_SEGUE_ANSWER_QUESTION        @"answerQuestion"
#define MANUAL_SEGUE_MAKE_APPOINTMENT       @"makeAppointment"
#define MANUAL_SEGUE_PUBLISH_COURSE         @"publishCourse"
#define MANUAL_SEGUE_TEACHER_HOMEWORK       @"teacherHomework"
#define MANUAL_SEGUE_STUDENT_HOMEWORK       @"studentHomework"
#define MANUAL_SEGUE_NEWS                   @"news"
#define MANUAL_SEGUE_GOOD_TEACHER           @"goodTeacher"

@interface IndexViewController ()

@property(strong, nonatomic) CourseService *courseService;
@property(strong, nonatomic) NewsService *newsService;
@property(strong, nonatomic) CommonService *commonService;
@property(strong, nonatomic) KalViewController *kalController;

@end

@implementation IndexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initKalController
{
    self.kalController = [[KalViewController alloc] initWithSelectionMode:KalSelectionModeSingle];
    self.kalController.selectedDate = [NSDate date];
    
    self.kalController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Today", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(showAndSelectToday)];
}

- (void)showAndSelectToday
{
    [self.kalController showAndSelectDate:[NSDate date]];
}

- (void)initViewsByCurrentPersionID
{
    PERSONAL_ID personId = [self.commonService getCurrentPersonalID];
    if (personId == PERSONAL_STUDENT || personId == PERSONAL_GUEST) {
        [self.appoinBtn setBackgroundImage:[UIImage imageNamed:@"index_wyyy.png"] forState:UIControlStateNormal];
        [self.qaBtn setBackgroundImage:[UIImage imageNamed:@"index_wytw.png"] forState:UIControlStateNormal];
    }else if (personId == PERSONAL_TEACHER){
        [self.appoinBtn setBackgroundImage:[UIImage imageNamed:@"index_fbkc.png"] forState:UIControlStateNormal];
        [self.qaBtn setBackgroundImage:[UIImage imageNamed:@"index_wyhd.png"] forState:UIControlStateNormal];
    }else{
        
    }
}

- (void)initService
{
    self.courseService = [[CourseService alloc] init];
    self.newsService = [[NewsService alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (IPHONE5) {
        self.mainScrollView.scrollEnabled = NO;
    }
    
    [self initViewsByCurrentPersionID];
    
    self.commonService = [[CommonService alloc] init];
    User *loginUser = [self.commonService currentLoginUser];
    
    if (loginUser != nil) {
        self.navigationItem.rightBarButtonItem = nil;
        return;
    }
    
    if ([self.commonService getLoginCheckBox] && [self.commonService getLastLoginMobile] != nil) {
        [self performSegueWithIdentifier:MANUAL_SEGUE_LOGIN sender:self];
        return;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:MANUAL_SEGUE_GOOD_COURSE]) {
        CourseTableViewController *goodCourseViewCon = segue.destinationViewController;
        goodCourseViewCon.courses = [self.courseService listAllGoodCourses];
    }else if ([segue.identifier isEqualToString:MANUAL_SEGUE_NEWS]){
        NewsTableViewController *newsTableViewCon = segue.destinationViewController;
        newsTableViewCon.allNews = [self.newsService listAllNews];
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)appointBtnClick:(id)sender {
    
    PERSONAL_ID personId = [self.commonService getCurrentPersonalID];
    NSString *performSegueId = nil;
    switch (personId) {
        case PERSONAL_GUEST:
            performSegueId = MANUAL_SEGUE_LOGIN;
            break;
        case PERSONAL_STUDENT:
        case PERSONAL_VIP:
            performSegueId = MANUAL_SEGUE_MAKE_APPOINTMENT;
            break;
        case PERSONAL_TEACHER:
            performSegueId = MANUAL_SEGUE_PUBLISH_COURSE;
            break;
    }
    
    [self performSegueWithIdentifier:performSegueId sender:self];
}

- (IBAction)goodCourseBtnClick:(id)sender {

    [self performSegueWithIdentifier:MANUAL_SEGUE_GOOD_COURSE sender:self];
}

- (IBAction)newsBtnClick:(id)sender {
    
    [self performSegueWithIdentifier:MANUAL_SEGUE_NEWS sender:self];
}

- (IBAction)goodTeacherBtnClick:(id)sender {
    
    [self performSegueWithIdentifier:MANUAL_SEGUE_GOOD_TEACHER sender:self];
}

- (IBAction)homeworkBtnClick:(id)sender {
    
    PERSONAL_ID personId = [self.commonService getCurrentPersonalID];
    NSString *performSegueId = nil;
    switch (personId) {
        case PERSONAL_GUEST:
            performSegueId = MANUAL_SEGUE_LOGIN;
            break;
        case PERSONAL_STUDENT:
        case PERSONAL_VIP:
            performSegueId = MANUAL_SEGUE_STUDENT_HOMEWORK;
            break;
        case PERSONAL_TEACHER:
            performSegueId = MANUAL_SEGUE_TEACHER_HOMEWORK;
            break;
    }
    
    [self performSegueWithIdentifier:performSegueId sender:self];
}

- (IBAction)qaBtnClick:(id)sender {
    
    PERSONAL_ID personId = [self.commonService getCurrentPersonalID];
    NSString *performSegueId = nil;
    switch (personId) {
        case PERSONAL_GUEST:
            performSegueId = MANUAL_SEGUE_LOGIN;
            break;
        case PERSONAL_STUDENT:
        case PERSONAL_VIP:
            performSegueId = MANUAL_SEGUE_ASK_QUESTION;
            break;
        case PERSONAL_TEACHER:
            performSegueId = MANUAL_SEGUE_ANSWER_QUESTION;
            break;
    }
    
    [self performSegueWithIdentifier:performSegueId sender:self];}

- (void)calendarBtnClick:(id)sender
{
    if (self.kalController == nil) {
        [self initKalController];
    }
    
    [self.navigationController pushViewController:self.kalController animated:YES];
}
@end
