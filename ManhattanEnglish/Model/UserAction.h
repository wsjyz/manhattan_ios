//
//  UserAction.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-7-6.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAction : NSObject

@property (nonatomic, strong) NSString *actionId;       //动作Id
@property (nonatomic, strong) NSString *userId; //用户ID

/*
 COLLECT_TEACHER
 FOLLOW_TEACHER
 COMMENT_TEACHER
 COLLECT_COURSE
 FOLLOW_COURSE
 COMMENT_COURSE
 */
@property (nonatomic, strong) NSString *actionType; //动作类型 (收藏 关注)
@property (nonatomic, strong) NSDate *actionTime; //操作时间
@property (nonatomic, strong) NSString *resourceId; //关联资源ID（课程courseId，教师userId）
@property (nonatomic, strong) NSString *status; //状态

@end
