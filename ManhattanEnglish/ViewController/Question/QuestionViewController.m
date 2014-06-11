//
//  QuestionViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuestionViewController.h"
#import "QuesTableViewCell.h"
#import "QuesDetailViewController.h"
#import "QuestionService.h"
#import "CommonService.h"

@interface QuestionViewController ()
{
    IBOutlet UITableView *_tableView;
    NSArray *_resourceArr;
    QuestionService *_quesService;
    CommonService *_commonService;
}

@end

@implementation QuestionViewController

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
    _commonService = [[CommonService alloc] initWithDelegate:nil];
    _quesService = [[QuestionService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"我的问题"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.navigationController.view addSubview:hud];
    
    [hud showAnimated:YES whileExecutingBlock:^{
        _resourceArr = [_quesService myQuestionsWithUserId:[_commonService getCurrentUserID]];
    } completionBlock:^{
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
    QuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QuesTableViewCell"];
    if (cell == nil)
    {
        cell = [ViewUtil viewFromNibOfClass:[QuesTableViewCell class] owner:self];
    }
    cell.content.text = @"uasho iqwhcosudchowcp uos oashuco doqu usocwf[0fi[e0f eu[ehcnv ue[0urcv0[ e0[wuh";
    [cell setFrame:CGRectMake(0, 0, CGRectGetWidth(_tableView.frame), MAXFLOAT)];
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuesDetailViewController *quesDetailVC = [ViewUtil viewControllerFromNibOfClass:[QuesDetailViewController class]];
    [self.navigationController pushViewController:quesDetailVC animated:YES];
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
