//
//  OpenHomeworkService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"
#import "Page.h"
#import "HomeWork.h"
#import "HomeworkSubmit.h"

@interface OpenHomeworkService : BaseRestService

/**
 * 获取指定学生的作业列表
 * @return
 */
- (Page *)getHomeworksByUserWithPage:(Page*)page andUserID:(NSString *)userID;

/**
 * 获取指定教师的作业列表
 * @return
 */
- (Page *)getHomeworksByTeacherWithPage:(Page *)page andTeacherID:(NSString *)teacherID;

/**
 * 发布一个新的作业
 * @param homeWork
 */
- (HomeWork *)postHomeWorkL:(HomeWork *)homework;

/**
 * 提交一个新的作业
 * @param homeworkSubmit
 */
- (HomeworkSubmit *)submitHomeWork:(HomeworkSubmit *)submitHomeWork;

@end
