//
//  StudentMainCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "StudentMainCell.h"

@implementation StudentMainCell

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
    CGSize addressSize = [_address.text sizeWithFont:_address.font constrainedToSize:CGSizeMake(CGRectGetWidth(_address.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    float addressHeight = addressSize.height>CGRectGetHeight(_address.frame)? addressSize.height : CGRectGetHeight(_address.frame);
    _address.frame = CGRectMake(CGRectGetMinX(_address.frame), CGRectGetMinY(_address.frame), CGRectGetWidth(_address.frame), addressHeight);
    [super setFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetMaxY(_address.frame)+10)];
}

@end
