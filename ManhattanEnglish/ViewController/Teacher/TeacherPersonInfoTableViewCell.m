//
//  TeacherPersonInfoTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherPersonInfoTableViewCell.h"

@implementation TeacherPersonInfoTableViewCell

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
    CGSize size = [_content.text sizeWithFont:_content.font constrainedToSize:CGSizeMake(CGRectGetWidth(_content.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _content.frame = CGRectMake(CGRectGetMinX(_content.frame), CGRectGetMinY(_content.frame), CGRectGetWidth(_content.frame), size.height);
    [super setFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetMaxY(_content.frame)+5)];
}

@end
