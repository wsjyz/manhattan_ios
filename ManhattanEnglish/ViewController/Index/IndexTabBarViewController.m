//
//  IndexTabBarViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "IndexTabBarViewController.h"

@interface IndexTabBarViewController ()

@end

@implementation IndexTabBarViewController

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
    
    [self.tabBar.items[3] setTitle:@"试听"];
    [self.tabBar.items[3] setImage:[UIImage imageNamed:@"tab_audition_n.png"]];
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
