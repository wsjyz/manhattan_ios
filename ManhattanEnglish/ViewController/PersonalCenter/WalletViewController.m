//
//  WalletViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletTableViewCell.h"
#import "WalletService.h"
#import "CommonService.h"

@interface WalletViewController ()
{
    IBOutlet UITableView *_tableView;
    IBOutlet UILabel *_totalMoney;
    WalletService *_walletService;
    CommonService *_commonService;
    NSUInteger _Money;
    NSArray *_resourceArr;
}

@end

@implementation WalletViewController

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
    _walletService = [[WalletService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"钱包"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.navigationController.view addSubview:hud];
    
    [hud showAnimated:YES whileExecutingBlock:^{
        _Money = [_walletService getBalancesWithUserID:[_commonService getCurrentUserID]];
        _resourceArr = [_walletService getMoneyRecordsWithUserID:[_commonService getCurrentUserID]];
    } completionBlock:^{
        _totalMoney.text = [NSString stringWithFormat:@"%i RMB",_Money];
        if (_resourceArr)
        {
            [_tableView reloadData];
        }
        [hud removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WalletTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WalletTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[WalletTableViewCell class] owner:self];
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
