//
//  ViewUtil.m
//  WorkFlow
//
//  Created by liujiafei on 14-1-15.
//  Copyright (c) 2014年 liujiafei. All rights reserved.
//

#import "ViewUtil.h"

#define differTime                                          30*60     //单位:秒
#define FIELD_BLG_BASE_SECOND_AGO                           @"%d秒前"
#define FIELD_BLG_BASE_MINUTE_AGO                           @"%d分钟前"
#define FIELD_BLG_BASE_HOUR_AGO                             @"%d小时前"
#define FIELD_BLG_BASE_DAY_AGO                              @"%d天前"
#define FIELD_BLG_BASE_MONTH_AGO                            @"%d月前"
#define FIELD_BLG_BASE_YEAR_AGO                             @"%d年前"

@implementation ViewUtil

+ (BOOL)fileExistAtPath:(NSString *)path
{
    if (path == nil) {
        return NO;
    }
    return [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:NO];
}

+ (NSString *) nibNameOfClass:(Class)view
{
    NSString *className = NSStringFromClass([view class]);
    if (ISPAD)
    {
        className = [NSString stringWithFormat:@"%@_ipad",className];
    }

    NSString *nibName = className;
    if (IPHONE5)
    {
        nibName = [NSString stringWithFormat:@"%@_p5",nibName];
    }
    // xib文件路径
    NSString *xibFilePath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:[nibName stringByAppendingString:@".nib"]];
    if (![self fileExistAtPath:xibFilePath])
    {
        nibName = className;
    }
    return nibName;
}

+ (id)viewControllerFromNibOfClass:(Class)classOfController
{
    return [[classOfController alloc] initWithNibName:[self nibNameOfClass:classOfController] bundle:nil];
}

+ (id) viewFromNibOfClass:(Class)classOfView owner:(id)owner
{
    return [[[NSBundle mainBundle]loadNibNamed:[self nibNameOfClass:classOfView] owner:owner options:nil]objectAtIndex:0];
}

+ (id)getWindowRootViewController
{
    UIWindow *window = nil;
    for(id w in [UIApplication sharedApplication].windows)
    {
        if([w isKindOfClass:[UIWindow class]])
        {
            window = w;
            break;
        }
    }
    return (UINavigationController*)window.rootViewController;
}


+ (NSString *)timeStrWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}

@end
