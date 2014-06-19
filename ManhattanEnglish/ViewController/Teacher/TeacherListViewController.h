//
//  TeacherListViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@protocol TeacherListDelegate <NSObject>

- (void)selectTeacherWithTeacherID:(NSString *)teacherID andTeacherName:(NSString *)teacherName;

@end

@interface TeacherListViewController : BaseViewController

@property (nonatomic, weak) id<TeacherListDelegate> delegate;
@property (nonatomic, assign) BOOL selectTeacher;

@end
