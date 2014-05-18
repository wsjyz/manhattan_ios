//
//  PrepareViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "PrepareViewController.h"
#import "CommonService.h"

@interface PrepareViewController ()

@end

@implementation PrepareViewController

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

- (IBAction)loginBtnClick:(id)sender
{
    CommonService *commonService = [[CommonService alloc] init];
    
    PERSONAL_ID personId = self.personIdSegControl.selectedSegmentIndex;
    [commonService updateCurrentPersonalID:personId];
    
    [self performSegueWithIdentifier:@"index" sender:self];
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
