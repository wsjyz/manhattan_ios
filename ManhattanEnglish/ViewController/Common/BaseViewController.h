//
//  BaseViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (BOOL)hidesBottomBar;

- (void)setNavgationItemTitle:(NSString *)title;

- (void)showErrorInfoWithMessage:(NSString *)message delegate:(id)delegate;

@end
