//
//  BaseViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TbcLibCore/ErrorInfo.h>
#import <TbcLibCore/OpenService.h>
#import <TbcLibUI/MBProgressHUD.h>

@interface BaseViewController : UIViewController<ServiceDelegate,MBProgressHUDDelegate>

- (void)initService;

- (void)showErrorInfoWithMessage:(NSString *)message delegate:(id)delegate;

- (BOOL)hidesBottomBar;

- (void)setNavgationItemTitle:(NSString *)title;

@end
