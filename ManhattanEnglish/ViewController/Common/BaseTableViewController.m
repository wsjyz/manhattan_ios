//
//  BaseTableViewController.m
//  CloudStudySeal
//
//  Created by liujiafei on 13-7-3.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import "BaseTableViewController.h"
#import "NodataBgView.h"
#import "TableFooterView.h"
#import "CKRefreshControl.h"
#import <TbcLibCore/ErrorInfo.h>
#import "LoginViewController.h"


@interface BaseTableViewController ()
{
    NodataBgView *_nodataBgView;
}

@property (assign, nonatomic) BOOL isLoadingMore;
@property (assign, nonatomic) BOOL isRefreshing;

@end


@interface BaseTableViewController ()
{
    // with default separator style none
    UITableViewCellSeparatorStyle _backupSepStyle;
}

- (void)initRefreshControl;

- (void)initNodataView;

- (void)refreshNodataView:(BOOL)hasData;

- (void)initFootView;

- (BOOL)hasDataInTableViewOfFirstSection;


@end



@implementation BaseTableViewController

- (NSString *)viewName
{
    return @"BaseTableViewController";
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initService
{
    // To be implemented by sub classes.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    if(ISiOS7)
    {
        self.edgesForExtendedLayout= UIRectEdgeNone;
    }
    
    // init service
    [self initService];
    
    // init refresh control
    [self initRefreshControl];
    
    // init no data view
    [self initNodataView];
    
    // init load more
    if (self.enableLoadmore) {
        [self initFootView];
    }
    
    [self setLeftButtonWithImageName:@"back.png" title:nil];
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

- (void)resetNodataViewImageName:(NSString *)imageName text:(NSString *)text
{
    if (!self.displayNodataViewIfNeeded || _nodataBgView == nil) {
        return;
    }
    
    _nodataBgView.centerImageView.image = [UIImage imageNamed:imageName];
    _nodataBgView.centerLabel.text = text;
}

- (BOOL)hasDataInTableViewOfFirstSection
{
    return self.tableView.numberOfSections > 0 && [self.tableView numberOfRowsInSection:0] > 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NodataView

- (BOOL)displayNodataViewIfNeeded
{
    return NO;
}

- (void)initNodataView
{
    if (!self.displayNodataViewIfNeeded) {
        return;
    }
    
    _nodataBgView = [ViewUtil viewFromNibOfClass:[NodataBgView class] owner:self];
    [self.view addSubview:_nodataBgView];
    _nodataBgView.hidden = YES;
    
    // backup table view sep style
    _backupSepStyle = self.tableView.separatorStyle;
}

- (void)refreshNodataView:(BOOL)hasData
{
    _nodataBgView.hidden = hasData;
    self.tableView.separatorStyle = hasData ? _backupSepStyle : UITableViewCellSeparatorStyleNone;
}

#pragma mark - Refreshing

- (BOOL)enableRefresh
{
    return NO;
}

- (void)initRefreshControl
{
    if (!self.enableRefresh) {
        return;
    }
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventValueChanged];
}

- (BOOL)refreshData
{
    if (self.isRefreshing)
        return NO;
    
    self.isRefreshing = YES;
    
    return YES;
}

- (void)willBeginRefreshData
{
    [self.refreshControl beginRefreshing];
    [self.tableView setContentOffset:CGPointMake(0, -self.refreshControl.frame.size.height) animated:YES];
}

- (void)doRefresh:(CKRefreshControl *)sender
{
//    [self refreshData];
}

- (void)refreshDataComplete
{
    self.isRefreshing = NO;
    
    // endRefreshing
    [self.refreshControl endRefreshing];
    
    BOOL hasData = [self hasDataInTableViewOfFirstSection];
    if (self.displayNodataViewIfNeeded) {
        [self refreshNodataView: hasData];
    }
    
    BOOL dispalyFooterView = (self.enableLoadmore && hasData && !self.canLoadMore);
    TableFooterView *fv = (TableFooterView *)self.tableView.tableFooterView;
    fv.infoLabel.hidden = !dispalyFooterView;
}
 
#pragma mark - Load More

- (BOOL)enableLoadmore
{
    return NO;
}

- (BOOL)canLoadMore
{
    // To be implemented by sub classes.
    return YES;
}

- (void)initFootView
{
    TableFooterView *footerView = [ViewUtil viewFromNibOfClass:[TableFooterView class] owner:self];
    self.tableView.tableFooterView = footerView;
}

- (void) willBeginLoadingMore
{
    TableFooterView *fv = (TableFooterView *)self.tableView.tableFooterView;
    [fv.activityIndicator startAnimating];
}

- (void) loadMoreCompleted
{
    TableFooterView *fv = (TableFooterView *)self.tableView.tableFooterView;
    [fv.activityIndicator stopAnimating];
    
    if (!self.canLoadMore) {
        // Do something if there are no more items to load
        
        // We can hide the footerView by: [self setFooterViewVisibility:NO];
        
        // Just show a textual info that there are no more items to load
        fv.infoLabel.hidden = NO;
    }
    
    self.isLoadingMore = NO;
}

- (BOOL) loadMore
{
    if (self.isLoadingMore)
        return NO;
    
    [self willBeginLoadingMore];
    self.isLoadingMore = YES;
    return YES;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (!self.isLoadingMore && self.canLoadMore) {
        float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
        if (bottomEdge >= scrollView.contentSize.height - 1) {
            [self loadMore];
        }
    }
}

#pragma mark - ServiceDelegate

- (void)onError:(NSError *)error requestUri:(NSString *)requestUri
{
    ErrorInfo *errInfo = [error firstOrDefaultErrorInfo];
    if(errInfo != nil){
        
        [self showErrorInfoWithMessage:errInfo.cause delegate:nil];
    }
}

- (void)backToLoginViewController
{
    UINavigationController *nav = [ViewUtil getWindowRootViewController];
    if (nav.viewControllers.count <= 1) {
        return;
    }
    
    UIViewController *rootViewController = nav.viewControllers[0];
    if ([rootViewController isMemberOfClass:[LoginViewController class]]) {
        ((LoginViewController *)rootViewController).isLogout = YES;
    }
    [nav popToRootViewControllerAnimated:YES];
}

- (void)setNavgationItemTitle:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 0, 90, BAR_HEIGHT)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:21.0];
    titleLabel.textAlignment = UITextAlignmentCenter;

    self.navigationItem.titleView = titleLabel;
}

- (void)showErrorInfoWithMessage:(NSString *)message delegate:(id)delegate
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view.window animated:YES];
    [hud showAndDismissWithMessage:message];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

@end
