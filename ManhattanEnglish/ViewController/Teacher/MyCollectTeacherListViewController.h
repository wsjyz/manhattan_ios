//
//  MyCollectTeacherListViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface MyCollectTeacherListViewController : BaseViewController

@property (nonatomic, weak) IBOutlet UIView *collectInnerView;
@property (nonatomic, weak) IBOutlet UIView *studentInnerView;

@property (nonatomic, assign) BOOL isCollectTeacher;

@end
