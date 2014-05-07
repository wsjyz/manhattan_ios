//
//  TeacherMainCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherMainCell.h"

@implementation TeacherMainCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame
{
    CGSize nameSize = [_name.text sizeWithFont:_name.font constrainedToSize:CGSizeMake(175, CGRectGetHeight(_name.frame)) lineBreakMode:NSLineBreakByWordWrapping];
    _name.frame = CGRectMake(CGRectGetMinX(_name.frame), CGRectGetMinY(_name.frame), nameSize.width+2, CGRectGetHeight(_name.frame));
    _sexImg.frame = CGRectMake(CGRectGetMaxX(_name.frame)+5, CGRectGetMinY(_sexImg.frame), CGRectGetWidth(_sexImg.frame), CGRectGetHeight(_sexImg.frame));
    [super setFrame:frame];
}

@end
