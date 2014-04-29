//
//  MoreViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "MoreViewController.h"
#import "AboutViewController.h"
#import "ContactUsViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

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
    [self setNavgationItemTitle:@"更多"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(280, 9, 22, 22)];
        img.image = [UIImage imageNamed:@"arrow.png"];
        img.backgroundColor = [UIColor clearColor];
        [cell addSubview:img];
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"关于我们";
            break;
        }
        case 1:
        {
            cell.textLabel.text = @"软件更新";
            break;
        }
        case 2:
        {
            cell.textLabel.text = @"联系我们";
            break;
        }
            
        default:
            break;
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            AboutViewController *aboutVC = [ViewUtil viewControllerFromNibOfClass:[AboutViewController class]];
            [self.navigationController pushViewController:aboutVC animated:YES];
            break;
        }
        case 2:
        {
            ContactUsViewController *contactVC = [ViewUtil viewControllerFromNibOfClass:[ContactUsViewController class]];
            [self.navigationController pushViewController:contactVC animated:YES];
            break;
        }
            
        default:
            break;
    }
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
