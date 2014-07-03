//
//  QuesDetailTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuesDetailTableViewCell.h"

@implementation QuesDetailTableViewCell

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
    CGSize contentSize = [_content.text sizeWithFont:_content.font constrainedToSize:CGSizeMake(CGRectGetWidth(_content.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _content.frame = CGRectMake(CGRectGetMinX(_content.frame), CGRectGetMinY(_content.frame), CGRectGetWidth(_content.frame), contentSize.height);
    float maxHeight = CGRectGetMaxY(_content.frame);
    if (!_answerTeacher.hidden)
    {
        CGSize nameSize = [_answerName.text sizeWithFont:_answerName.font constrainedToSize:CGSizeMake(_answerName.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        _answerName.frame = CGRectMake(CGRectGetMinX(_answerName.frame), CGRectGetMinY(_answerName.frame), CGRectGetWidth(_answerName.frame), nameSize.height);
        maxHeight = nameSize.height >= CGRectGetHeight(_answerTeacher.frame)? CGRectGetMaxY(_answerName.frame):CGRectGetMaxY(_answerTeacher.frame);
    }
    [super setFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), maxHeight + 10)];
}

@end
