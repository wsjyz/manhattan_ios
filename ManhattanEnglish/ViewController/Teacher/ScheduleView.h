//
//  ScheduleView.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleView : UIView
{
    __weak IBOutlet UIButton *_foreBtn;
    __weak IBOutlet UIButton *_afterBtn;
    __weak IBOutlet UIButton *_afterSixBtn;
}

@property (nonatomic, assign) BOOL enable;

- (IBAction)ButtonPressed:(id)sender;

- (void)showForeBtn:(BOOL)show;
- (void)showAfterBtn:(BOOL)show;
- (void)showAfterSixBtn:(BOOL)show;

@end
