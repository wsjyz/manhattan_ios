//
//  PersonalInfoViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-29.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "CommonService.h"
#import "InfoTableViewCell.h"
#import "User.h"
#import <TbcLibUI/UIImageView+WebCache.h>

#define VALUE(value)        value == nil ? @"" : value

@interface PersonalInfoViewController ()
{
    IBOutlet UITableView *_tableView;
    IBOutlet UIImageView *_faceImg;
    IBOutlet UILabel *_name;
    IBOutlet UIImageView *_sexImg;
    CommonService *_commonService;
    PERSONAL_ID _personalID;
    User *_user;
}

@end

@implementation PersonalInfoViewController

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
    _commonService = [[CommonService alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"个人资料"];   
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _name.text = VALUE(_user.userName);
    if (_user.avatar)
    {
        [_faceImg setImageWithURL:[NSURL URLWithString:_user.avatar] placeholderImage:[UIImage imageNamed:@"personal_head.png"]];
    }
    if (_user.sex && [_user.sex isEqualToString:SEX_MALE])
    {
        _sexImg.image = [UIImage imageNamed:@"personal_boy.png"];
    }
    else if (_user.sex && [_user.sex isEqualToString:SEX_FEMALE])
    {
        _sexImg.image = [UIImage imageNamed:@"personal_girl.png"];
    }
    else
    {
        _sexImg.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"基本资料";
    }
    else
    {
        return @"其它信息";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUInteger num = 0;
    switch (section) {
        case 0:
        {
            num = 3;
            break;
        }
        case 1:
        {
            if (_personalID == PERSONAL_TEACHER)
            {
                num = 3;
            }
            else
            {
                num = 2;
            }
        }
            
        default:
            break;
    }
    return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[InfoTableViewCell class] owner:self];
    }
    
    NSUInteger row = indexPath.row;
    switch (indexPath.section) {
        case 0:
        {
            if (row == 0)
            {
                cell.titleLabel.text = @"手机号:";
                cell.content.text = _user.mobile;
            }
            else if (row == 1)
            {
                cell.titleLabel.text = @"邮箱:";
                cell.content.text = VALUE(_user.email);
            }
            else
            {
                cell.titleLabel.text = @"地址:";
                cell.content.text = VALUE(_user.address);
            }
            break;
        }
        case 1:
        {
            if (row == 0)
            {
                cell.titleLabel.text = @"积分:";
                cell.content.text = [NSString stringWithFormat:@"%i",_user.credits];
            }
            else if (row == 1 && _personalID != PERSONAL_TEACHER)
            {
                cell.titleLabel.text = @"VIP到期时间:";
                cell.content.text = [ViewUtil timeStrWithDate:_user.vipExpiredTime];
            }
            else if (row == 1 && _personalID == PERSONAL_TEACHER)
            {
                cell.titleLabel.text = @"评分:";
                cell.content.text = [NSString stringWithFormat:@"%i",_user.score];
            }
            else
            {
                cell.titleLabel.text = @"评价:";
                cell.content.text = VALUE(_user.evaluation);
            }
            break;
        }
            
        default:
            break;
    }
    
    [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), MAXFLOAT)];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
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
