//
//  BaseViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

#define DEFAULT_HIDES_BOTTOM_BAR        NO

@interface BaseViewController ()

- (void)customInitLayout;

@end

@implementation BaseViewController

- (void)customInitLayout
{
    self.hidesBottomBarWhenPushed = [self hidesBottomBar];
}

- (BOOL)hidesBottomBar
{
    return DEFAULT_HIDES_BOTTOM_BAR;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self customInitLayout];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        [self customInitLayout];
    }
    return self;
}

- (void)initService
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if([[[UIDevice currentDevice] systemVersion]floatValue]<7.0f)
    {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    }
    if(ISiOS7)
    {
        self.edgesForExtendedLayout= UIRectEdgeNone;
    }
    
    // init service
    [self initService];
    
    NSString *navImg = ISiOS7? @"Navigation-Bar.png":@"Navigation-Bar_6.png";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:navImg] forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self setLeftButtonWithImageName:@"back.png" title:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNavgationItemTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 90, BAR_HEIGHT)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:21.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}

- (void)setLeftButtonWithImageName:(NSString *)imgName title:(NSString *)title
{
    UIButton *coustomButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 51, 48)];
    coustomButton.backgroundColor = [UIColor clearColor];
    [coustomButton setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    [coustomButton setBackgroundImage:[UIImage imageNamed:@"button-ok.png"] forState:UIControlStateHighlighted];
    
    if (imgName != nil)
    {
        [coustomButton setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    
    if (title != nil)
    {
        coustomButton.frame = CGRectMake(0, 0, 55, 20);
        [coustomButton setTitle:title forState:UIControlStateNormal];
        coustomButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [coustomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [coustomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    [coustomButton addTarget:self action:@selector(leftBtnPressed)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:coustomButton];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)leftBtnPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showErrorInfoWithMessage:(NSString *)message delegate:(id)delegate
{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
//    hud.delegate = delegate;
//    [hud showAndDismissWithMessage:message];
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
