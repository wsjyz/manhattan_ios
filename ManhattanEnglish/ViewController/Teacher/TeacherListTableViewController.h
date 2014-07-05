//
//  TeacherListTableViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-11.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum
{
    Tea_type_all = 0,
    Tea_type_Collect = 1,
    Tea_type_order = 2,
    Tea_type_listen 
}TEACHER_TYPE;

@protocol TeacherListTVCDelegate <NSObject>

- (void)selectTeacherID:(NSString *)teacherID andTeacherName:(NSString *)name;

@end

@interface TeacherListTableViewController:BaseTableViewController

@property (nonatomic, strong) NSMutableArray *resourceArr;
@property (nonatomic, strong) NSString *searchKey;
@property (nonatomic, assign) BOOL selectTeacher;
@property (nonatomic, weak) id<TeacherListTVCDelegate> teacherDelegate;
@property (nonatomic, assign) TEACHER_TYPE teacherType;

@end
