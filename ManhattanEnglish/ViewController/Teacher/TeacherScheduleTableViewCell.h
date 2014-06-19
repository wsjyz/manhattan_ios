//
//  TeacherScheduleTableViewCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleView.h"

@interface TeacherScheduleTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *scheduleArr;
@property (nonatomic, assign) BOOL enable;

@end
