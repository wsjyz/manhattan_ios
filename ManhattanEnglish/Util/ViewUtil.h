//
//  ViewUtil.h
//  WorkFlow
//
//  Created by liujiafei on 14-1-15.
//  Copyright (c) 2014年 liujiafei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewUtil : NSObject

+ (id) viewControllerFromNibOfClass:(Class)classOfController;

+ (id) viewFromNibOfClass:(Class)classOfView owner:(id)owner;

+ (id)getWindowRootViewController;

//将date转换成string 
+ (NSString *)timeStrWithDate:(NSDate *)date;
+ (NSString *)timeAllStrWithDate:(NSDate *)date;


@end
