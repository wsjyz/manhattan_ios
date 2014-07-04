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
#import "QuestionViewController.h"
#import "TeacherHomeWorkViewController.h"
#import "LoginViewController.h"
#import "KxMenu.h"
#import "User.h"
#import "PersonalInfoViewController.h"
#import "WalletViewController.h"
#import "IndexTabBarViewController.h"

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

@property (strong, nonatomic) CourseService *courseService;
@property (strong, nonatomic) NewsService *newsService;
@property (strong, nonatomic) CommonService *commonService;
@property (strong, nonatomic) KalViewController *kalController;

@property (strong, nonatomic) User *loginUser;

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
    self.kalController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Today", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(showAndSelectToday)];
}

- (void)showAndSelectToday
{
    [self.kalController showAndSelectDate:[NSDate date]];
}

- (void)initViewsWithCurrentPersionID:(PERSONAL_ID)personId
{
    // btn images
    if (personId == PERSONAL_STUDENT || personId == PERSONAL_GUEST) {
        
        [self.appoinBtn setBackgroundImage:[UIImage imageNamed:@"index_wyyy.png"] forState:UIControlStateNormal];
        [self.qaBtn setBackgroundImage:[UIImage imageNamed:@"index_wytw.png"] forState:UIControlStateNormal];
    }else if (personId == PERSONAL_TEACHER){
        
        [self.appoinBtn setBackgroundImage:[UIImage imageNamed:@"index_fbkc.png"] forState:UIControlStateNormal];
        [self.qaBtn setBackgroundImage:[UIImage imageNamed:@"index_wyhd.png"] forState:UIControlStateNormal];
    }else{
        
        
    }
    
    // tab bar items
    NSArray *items = self.tabBarController.tabBar.items;
    
    // disable function items if not login
    [items[1] setEnabled:self.loginUser != nil];
    [items[2] setEnabled:self.loginUser != nil];
    [items[3] setEnabled:self.loginUser != nil];
}

- (void)initService
{
    self.courseService = [[CourseService alloc] init];
    self.newsService = [[NewsService alloc] init];
    self.commonService = [[CommonService alloc] init];
}

- (void)showItemCalendar
{
    if (self.kalController == nil) {
        [self initKalController];
    }
    
    NSArray *dateArr = [CommonUtil getFirstAndLastDateOfCurrentMonth];
    NSArray *courseDateArr = [self.courseService getScheduleWithStartTime:dateArr[0] endTime:dateArr[1] userId:[self.commonService getCurrentUserID]];
    self.kalController.initialHighlightedDates = courseDateArr;
    
    [self.navigationController pushViewController:self.kalController animated:YES];
}

- (void)showItemPersonDetail
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonalInfoViewController *personInfoVC = [storyBoard instantiateViewControllerWithIdentifier:@"personInfo"];
    [self.navigationController pushViewController:personInfoVC animated:YES];
}

- (void)showItemMyWallet
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WalletViewController *walletVC = [storyBoard instantiateViewControllerWithIdentifier:@"wallet"];
    [self.navigationController pushViewController:walletVC animated:YES];
}

- (void)showItemMyQues
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QuestionViewController *questionVC = [storyBoard instantiateViewControllerWithIdentifier:@"question"];
    questionVC.quesType = QuesType_ques;
    [self.navigationController pushViewController:questionVC animated:YES];
}

- (void)showItemLogout
{
    [_commonService updateCurrentUser:nil];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"loginView"];
    loginVC.isLogout = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)showQuickMenu
{
    User *loginUser = [self.commonService currentLoginUser];
    if (loginUser.userName == nil) {
        loginUser.userName = @"Unknown";
    }
    
    NSMutableArray *menuItems = [[NSMutableArray alloc] init];
    NSArray *itmes =
    @[
      [KxMenuItem menuItem:loginUser.userName
                     image:nil
                    target:nil
                    action:NULL],
      
      [KxMenuItem menuItem:@"个人资料"
                     image:nil
                    target:self
                    action:@selector(showItemPersonDetail)],
      
      [KxMenuItem menuItem:@"钱包"
                     image:nil
                    target:self
                    action:@selector(showItemMyWallet)],
      
      [KxMenuItem menuItem:@"日程表"
                     image:nil
                    target:self
                    action:@selector(showItemCalendar)]
      ];
    
    [menuItems addObjectsFromArray:itmes];
    if ([_commonService currentPersonalID] != PERSONAL_TEACHER)
    {
        [menuItems addObject:
         [KxMenuItem menuItem:@"我的问题"
                        image:nil
                       target:self
                       action:@selector(showItemMyQues)]
         ];
    }
    [menuItems addObject:
     [KxMenuItem menuItem:@"注销"
                    image:nil
                   target:self
                   action:@selector(showItemLogout)]
     ];
    
    [KxMenu setTintColor:[UIColor whiteColor]];
    [KxMenu showMenuInView:self.view
                  fromRect:CGRectMake(self.naviRightBtn.x, self.naviRightBtn.y - 44.0, self.naviRightBtn.width, self.naviRightBtn.height)
                 menuItems:menuItems];
    
}

- (void) pushMenuItem:(id)sender
{
    NSLog(@"%@", sender);
}

- (void)goToLogin
{
    [self performSegueWithIdentifier:MANUAL_SEGUE_LOGIN sender:self];
}

- (void)initNaviBtnsLayout:(BOOL)hasLogin
{
    // set image
    NSString *imageName = hasLogin ? @"nav_bar_person_btn_n.png" : nil;
    NSString *bgImageName = hasLogin ? nil : @"nav_bar_red_btn_n.png";
    
    [self.naviRightBtn setImage:[UIImage imageNamed:imageName] forState:
     UIControlStateNormal];
    [self.naviRightBtn setBackgroundImage:[UIImage imageNamed:bgImageName] forState:
     UIControlStateNormal];
    
    // clear all actions
    [self.naviRightBtn removeTarget:self action:NULL forControlEvents:UIControlEventAllEvents];
    
    // set selector
    SEL clickSel = hasLogin ? @selector(showQuickMenu) : @selector(goToLogin);
    [self.naviRightBtn addTarget:self action:clickSel forControlEvents:UIControlEventTouchUpInside];
    
    // set title
    NSString *title = hasLogin ? @"" : @"登录";
    [self.naviRightBtn setTitle:title forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.loginUser = [self.commonService currentLoginUser];
    
    PERSONAL_ID persionID = [self.commonService currentPersonalID];
    [self initViewsWithCurrentPersionID:persionID];
    
    BOOL hasLogin = self.loginUser != nil;
    [self initNaviBtnsLayout:hasLogin];
    
    IndexTabBarViewController *tabBarViewCon = (IndexTabBarViewController *)self.navigationController.tabBarController;
    if (tabBarViewCon != nil) {
        BOOL teacherRole = persionID == PERSONAL_TEACHER;
        [tabBarViewCon.tabBar.items[1] setTitle: teacherRole ? @"学生": @"收藏"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Do any additional setup after loading the view.
    if (IPHONE5) {
        self.mainScrollView.scrollEnabled = NO;
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
    UIViewController *viewController = segue.destinationViewController;
    viewController.hidesBottomBarWhenPushed = YES;
    
    if ([segue.identifier isEqualToString:MANUAL_SEGUE_GOOD_COURSE]) {
        CourseTableViewController *goodCourseViewCon = segue.destinationViewController;
        goodCourseViewCon.currPage = [self.courseService getWorthCourses:[CommonUtil defaultPage]];
    }else if ([segue.identifier isEqualToString:MANUAL_SEGUE_NEWS]){
        NewsTableViewController *newsTableViewCon = segue.destinationViewController;
        newsTableViewCon.currPage = [self.newsService getInformations];
    }
    else if ([segue.identifier isEqualToString:MANUAL_SEGUE_STUDENT_HOMEWORK])
    {
        QuestionViewController *quesVC = segue.destinationViewController;
        quesVC.quesType = QuesType_homeWork_Stu;
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)appointBtnClick:(id)sender {
    
    PERSONAL_ID personId = [self.commonService currentPersonalID];
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
    
    PERSONAL_ID personId = [self.commonService currentPersonalID];
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
    
    PERSONAL_ID personId = [self.commonService currentPersonalID];
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
    
    [self performSegueWithIdentifier:performSegueId sender:self];
}

@end
