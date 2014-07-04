//
//  GoodCourseTableViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"

@class Page;

@interface CourseTableViewController : BaseTableViewController

@property (strong, nonatomic) Page *currPage;

@end
