//
//  AppointService.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRestService.h"
#import "AppointSearchCondition.h"

@interface AppointService : BaseRestService

// 根据查询条件标识获取对应的选项列表
- (NSArray *)optionsWithConditionTag:(ConditionTag)tag;

- (NSArray *)findCourseWithAppointSearchCondition:(AppointSearchCondition *)condition;

@end
