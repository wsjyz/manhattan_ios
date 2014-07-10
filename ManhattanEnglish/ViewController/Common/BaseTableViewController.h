//
//  BaseTableViewController.h
//  CloudStudySeal
//
//  Created by liujiafei on 13-7-3.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseRestService.h"

@protocol BaseTableViewControllerdelegate <NSObject>

@optional
- (void)tableViewDidSelectRow:(NSUInteger)row;

@end

@interface BaseTableViewController : UITableViewController<RestServiceDelegate>

@property (nonatomic, weak) id<BaseTableViewControllerdelegate> baseTableViewDelegate;
@property (nonatomic, assign) BOOL autoRefreshData;

- (void)initService;

- (void)showErrorInfoWithMessage:(NSString *)message delegate:(id)delegate;

- (void)setNavgationItemTitle:(NSString *)title;

#pragma mark - NodataView

- (BOOL)displayNodataViewIfNeeded;

- (void)resetNodataViewImageName:(NSString *)imageName text:(NSString *)text;

#pragma mark - Refreshing

// Indicates whether enable pull to refresh function
- (BOOL)enableRefresh;

// Call this method before refresh data.
- (void)willBeginRefreshData;

// This refresh data will be called when pull to refresh.
- (BOOL)refreshData;

// Call to signal that "refresh data" was completed.
// You must keep it after your reloadData method (do not use it by async call)
- (void)refreshDataComplete;

#pragma mark - Load More

// Indicates whether can load more data
- (BOOL)canLoadMore;

// Indicates whether enable load more function
- (BOOL)enableLoadmore;

// Override to perform fetching of next page of data. It's important to call and get the value of
// of [super loadMore] first. If it's NO, -loadMore should be aborted.
- (BOOL)loadMore;

// Called when all the conditions are met and -loadMore will begin.
- (void)willBeginLoadingMore;

// Call to signal that "load more" was completed. This should be called so -isLoadingMore is
// properly set to NO.
- (void)loadMoreCompleted;

@end
