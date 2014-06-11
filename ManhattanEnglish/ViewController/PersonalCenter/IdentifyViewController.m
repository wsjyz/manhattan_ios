//
//  IdentifyViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "IdentifyViewController.h"
#import "TeacherService.h"
#import "CommonService.h"
#import <TbcLibUI/UIImageView+WebCache.h>

@interface IdentifyViewController ()
{
    IBOutlet UIScrollView *_scrollView;
    NSArray *_imgArr;
    TeacherService *_teacherService;
    CommonService *_commonService;
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

- (void)initService
{
    _teacherService = [[TeacherService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的认证"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.navigationController.view addSubview:hud];
    
    [hud showAnimated:YES whileExecutingBlock:^{
        _imgArr = [_teacherService getAuthDataWithUserID:[_commonService getCurrentUserID]];
    } completionBlock:^{
        if (_imgArr)
        {
            NSUInteger totalNum = _imgArr.count;
            _scrollView.contentSize = CGSizeMake(VIEW_WIDTH, 210*(totalNum/2 + totalNum%2));
            
            for (int i = 0;i < totalNum; i++)
            {
                int rowNum = i/2;
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10 + 150*(i % 2), 10+210*rowNum, 140, 200)];
                imgView.backgroundColor = [UIColor clearColor];
                [imgView setImageWithURL:[NSURL URLWithString:_imgArr[i]] placeholderImage:nil];
                [_scrollView addSubview:imgView];
            }        }
        [hud removeFromSuperview];
    }];
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
