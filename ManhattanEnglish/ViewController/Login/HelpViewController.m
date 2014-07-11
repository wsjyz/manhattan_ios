//
//  HelpViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int num = 3;
    float height = DEVICE_HEIGHT-STATUS_BAR_HEIGHT;
    if (ISiOS7)
    {
        height = DEVICE_HEIGHT;
    }
    _scrollView.contentSize = CGSizeMake(DEVICE_WIDTH*num,height);
    for (int i = 0; i < num; i++)
    {
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(DEVICE_WIDTH*i, 0, DEVICE_WIDTH, height)];
        imageView.backgroundColor = [UIColor clearColor];
        switch (i) {
            case 0:
                imageView.image = [UIImage imageNamed:@"1.png"];
                break;
            case 1:
                imageView.image = [UIImage imageNamed:@"2.png"];
                break;
            case 2:
                imageView.image = [UIImage imageNamed:@"3.png"];
                break;
                
            default:
                break;
        }
        [_scrollView addSubview:imageView];
        
        if (i == 2)
        {
            float maxY = height-75;
            if (IPHONE5)
            {
                maxY = height-95;
            }
            _img = [[UIImageView alloc] initWithFrame:CGRectMake(130, maxY, 59, 60)];
            [_img setImage:[UIImage imageNamed:IMG_STG_LOGO]];
            [imageView addSubview:_img];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(DEVICE_WIDTH *i + 130, maxY, 59, 60);
            btn.backgroundColor = [UIColor clearColor];
            [btn addTarget:self action:@selector(enterAppView) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:btn];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)enterApp:(id)sender
{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [self.navigationController pushViewController:[storyBoard instantiateInitialViewController] animated:YES];
}

@end
