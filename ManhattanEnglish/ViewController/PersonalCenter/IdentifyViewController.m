//
//  IdentifyViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "IdentifyViewController.h"

@interface IdentifyViewController ()
{
    IBOutlet UIScrollView *_scrollView;
    NSMutableArray *_imgArr;
}

@end

@implementation IdentifyViewController

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
    [self setNavgationItemTitle:@"我的认证"];
    
    _imgArr = [[NSMutableArray alloc] init];
    int totalNum = 4;
    _scrollView.contentSize = CGSizeMake(VIEW_WIDTH, 210*(totalNum/2 + totalNum%2));
    
    for (int i = 0;i < totalNum; i++)
    {
        int rowNum = i/2;
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 150*(i % 2), 10+210*rowNum, 140, 200)];
        imgView.backgroundColor = [UIColor yellowColor];
        [_scrollView addSubview:imgView];
        [_imgArr addObject:imgView];
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

@end
