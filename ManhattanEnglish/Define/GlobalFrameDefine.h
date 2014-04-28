//
//  GlobalFrameDefine.h
//  WorkFlow
//
//  Created by liujiafei on 14-1-15.
//  Copyright (c) 2014年 liujiafei. All rights reserved.
//

#ifndef WorkFlow_GlobalFrameDefine_h
#define WorkFlow_GlobalFrameDefine_h

#pragma mark -
#pragma mark AllDefine
#define ISPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IPHONE5  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define ISiOS7      ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)

#define DEVICE_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define DEVICE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define STATUS_BAR_HEIGHT (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
#define VIEW_WIDTH    CGRectGetWidth(self.view.frame)
#define VIEW_HEIGHT   CGRectGetHeight(self.view.frame)
//用于iPad放大百分比
#define TAB_BAR_HEIGHT              49.0f
#define BAR_HEIGHT                 (ISiOS7? 64.0f:44.0f)
#define KEY_BAR                     30.0f


#endif
