//
//  TeacherListTableViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-11.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseTableViewController.h"

@protocol TeacherListTVCDelegate <NSObject>

- (void)selectTeacherID:(NSString *)teacherID andTeacherName:(NSString *)name;

@end

@interface TeacherListTableViewController : BaseTableViewController

@property (nonatomic, strong) NSMutableArray *resourceArr;
@property (nonatomic, strong) NSString *searchKey;
@property (nonatomic, assign) BOOL selectTeacher;
@property (nonatomic, weak) id<TeacherListTVCDelegate> teacherDelegate;

@end
