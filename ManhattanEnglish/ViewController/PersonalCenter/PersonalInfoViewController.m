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

@interface PersonalInfoViewController ()
{
    IBOutlet UITableView *_tableView;
    CommonService *_commonService;
    PERSONAL_ID _personalID;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"个人资料"];
    _commonService = [[CommonService alloc] init];
    _personalID = [_commonService getCurrentPersonalID];
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
            }
            else if (row == 1)
            {
                cell.titleLabel.text = @"邮箱:";
            }
            else
            {
                cell.titleLabel.text = @"地址:";
            }
            break;
        }
        case 1:
        {
            if (row == 0)
            {
                cell.titleLabel.text = @"积分:";
            }
            else if (row == 1 && _personalID != PERSONAL_TEACHER)
            {
                cell.titleLabel.text = @"VIP到期时间:";
            }
            else if (row == 1 && _personalID == PERSONAL_TEACHER)
            {
                cell.titleLabel.text = @"评分:";
            }
            else
            {
                cell.titleLabel.text = @"评价:";
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
