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

@interface MyAppointViewController ()

@property (strong, nonatomic) CourseService *courseService;

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
    self.courseTableViewController.courses = [self.courseService listAllGoodCourses];
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
