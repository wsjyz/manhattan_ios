//
//  CourseHeaderView.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-16.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CourseHeaderView.h"
#import "AuditionDetailViewController.h"

@implementation CourseHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (IBAction)auditionBtnClick:(id)sender {
    
    if (self.delegate != nil) {
        [self.delegate auditionBtnClick];
    }
}

- (IBAction)appointBtnClick:(id)sender {
    
    if (self.delegate != nil) {
        [self.delegate appointBtnClick];
    }
}
@end
