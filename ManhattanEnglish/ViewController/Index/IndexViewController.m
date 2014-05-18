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

@interface IndexViewController ()

@property(strong, nonatomic) CommonService *commonService;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (IPHONE5) {
        self.mainScrollView.scrollEnabled = NO;
    }
    
    self.commonService = [[CommonService alloc] init];
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

- (IBAction)appointBtnClick:(id)sender {
}

- (IBAction)goodCourseBtnClick:(id)sender {
}

- (IBAction)newsBtnClick:(id)sender {
}

- (IBAction)goodTeacherBtnClick:(id)sender {
}

- (IBAction)homeworkBtnClick:(id)sender {
}

- (IBAction)qaBtnClick:(id)sender {
}
@end
