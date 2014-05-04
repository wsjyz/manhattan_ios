//
//  QuesTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "QuesTableViewCell.h"

@implementation QuesTableViewCell

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
    float MaxHeight = CGRectGetMaxY(_content.frame) + 10;
    MaxHeight = MaxHeight>40? MaxHeight:40;
    _arrow.frame = CGRectMake(CGRectGetMinX(_arrow.frame), (MaxHeight-CGRectGetHeight(_arrow.frame))/2, CGRectGetWidth(_arrow.frame), CGRectGetHeight(_arrow.frame));
    [super setFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), MaxHeight)];
}

@end
