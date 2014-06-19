//
//  ScheduleView.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "ScheduleView.h"

@implementation ScheduleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setEnable:(BOOL)enable
{
    _foreBtn.enabled = enable;
    _afterBtn.enabled = enable;
    _afterSixBtn.enabled = enable;
}

- (void)ButtonPressed:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 0)
    {
        btn.tag = 1;
    }
    else if (btn.tag == 1)
    {
        btn.tag = 0;
    }
}

- (void)updateBtnImg:(UIButton *)btn
{
    if (btn.tag == 0)
    {
        [btn setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
    }
    else if (btn.tag == 1)
    {
        [btn setBackgroundImage:[UIImage imageNamed:@"teacher_schedule_select.png"] forState:UIControlStateNormal];
    }
}

- (void)showForeBtn:(BOOL)show
{
    if (show)
    {
        _foreBtn.tag = 1;
    }
    else
    {
        _foreBtn.tag = 0;
    }
    [self updateBtnImg:_foreBtn];
}

- (void)showAfterBtn:(BOOL)show
{
    if (show)
    {
        _afterBtn.tag = 1;
    }
    else
    {
        _afterBtn.tag = 0;
    }
    [self updateBtnImg:_afterBtn];
}

- (void)showAfterSixBtn:(BOOL)show
{
    if (show)
    {
        _afterSixBtn.tag = 1;
    }
    else
    {
        _afterSixBtn.tag = 0;
    }
    [self updateBtnImg:_afterSixBtn];
}

@end
