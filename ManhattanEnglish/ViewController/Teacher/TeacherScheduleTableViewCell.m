//
//  TeacherScheduleTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherScheduleTableViewCell.h"

@implementation TeacherScheduleTableViewCell

- (void)awakeFromNib
{
    // Initialization code
    [self commonInit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)commonInit
{
    self.scheduleArr = [[NSMutableArray alloc] init];
    for (int i = 0;i < 7; i++)
    {
        ScheduleView *scheduleView = [ViewUtil viewFromNibOfClass:[ScheduleView class] owner:self];
        scheduleView.frame = CGRectMake(51+37*i, 105, 37, 125);
        scheduleView.enable = self.enable;
        [self addSubview:scheduleView];
        [self.scheduleArr addObject:scheduleView];
    }
    
}

@end
