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

@interface MyAppointViewController ()

@property (strong, nonatomic) CourseService *courseService;
@property (assign, nonatomic) BOOL isAudition;

@end

@implementation MyAppointViewController

- (void)initService
{
    self.courseService = [[CourseService alloc] initWithDelegate:self];
}

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
    
    self.navigationItem.leftBarButtonItem = nil;
    
    [self updateControlLayoutWithCurrentSegmentControlSelected];
    
    UITabBarItem *item = self.navigationController.tabBarItem;
    self.isAudition = [@"试听" isEqualToString:item.title];
    
    [self setNavgationItemTitle:self.isAudition? @"我的试听" : @"我的预约"];
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
    if ([@"innerCourse" isEqualToString:segue.identifier]) {
        
        CourseTableViewController *courseTableViewCon = [segue destinationViewController];
        courseTableViewCon.courses = [self.courseService listAllGoodCourses];
    }else if ([@"innerTeacher" isEqualToString:segue.identifier]) {
        
        TeacherListTableViewController *teacherTableViewCon = [segue destinationViewController];
//        courseTableViewCon.courses = [self.courseService listAllGoodCourses];
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
}
@end
