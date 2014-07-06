//
//  AboutViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
{
    IBOutlet UIScrollView *_scrollView;
}

@end

@implementation AboutViewController

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
    [self setNavgationItemTitle:@"关于我们"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:15];
    label.numberOfLines = 0;
    label.textColor = [UIColor grayColor];
    label.text = @"1905年，纽约曼哈顿的美国传教士William Stephen创办了Manhattan English School\n1917年，来自中国34岁的Peter Chen担任该校第一任中国校长，开始招收中国移民快速提高英语能力\n1934年，开始招收主要来自亚洲移民后裔进行免费的短期语言培训\n1954年，大量招收来自台湾的华人子女\n1965年，正式更名为Manhattan International English School，并开始向海外发展\n1974年，在台北设立分校\n1978年，在新加坡设立分校\n1980年，成立美国亚太华人教育集团（Asia-Pacific Oversea Chinese Education Co., Ltd），并在日韩设立分支机构，致力于在亚太地区发展\n2003年，首次授权中国武汉开设分支机构\n2010年，进驻上海\n2012年，在中国的业务重新组合，获得投资机构的大力支持，开始实施 Plan To Win的制胜计划";
    CGSize size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(280, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    label.frame = CGRectMake(10, 10, 280, size.height);
    [_scrollView addSubview:label];
    
    _scrollView.contentSize = CGSizeMake(300, size.height + 10);

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
