//
//  TeacherCommentTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TeacherCommentTableViewCell.h"

@implementation TeacherCommentTableViewCell

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
    CGSize spaceSize = CGSizeMake(5, 5);
    
    CGSize commentSize = [_commentContent.text sizeWithFont:_commentContent.font constrainedToSize:CGSizeMake(CGRectGetWidth(_commentContent.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _commentContent.frame = CGRectMake(CGRectGetMinX(_commentContent.frame), CGRectGetMinY(_commentContent.frame), CGRectGetWidth(_commentContent.frame), commentSize.height);
    
    _infoTitle.frame = CGRectMake(CGRectGetMinX(_infoTitle.frame), CGRectGetMaxY(_commentContent.frame) + spaceSize.height, CGRectGetWidth(_infoTitle.frame), CGRectGetHeight(_infoTitle.frame));
    _areaTitle.frame = CGRectMake(CGRectGetMinX(_areaTitle.frame), CGRectGetMaxY(_infoTitle.frame) + spaceSize.height, CGRectGetWidth(_areaTitle.frame), CGRectGetHeight(_areaTitle.frame));
    CGSize areaSize = [_area.text sizeWithFont:_area.font constrainedToSize:CGSizeMake(CGRectGetWidth(_area.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _area.frame = CGRectMake(CGRectGetMinX(_area.frame), CGRectGetMinY(_areaTitle.frame), CGRectGetWidth(_area.frame), areaSize.height);
    _modeTitle.frame = CGRectMake(CGRectGetMinX(_modeTitle.frame), CGRectGetMaxY(_area.frame) + spaceSize.height, CGRectGetWidth(_modeTitle.frame), CGRectGetHeight(_modeTitle.frame));
    CGSize modeSize = [_mode.text sizeWithFont:_mode.font constrainedToSize:CGSizeMake(CGRectGetWidth(_mode.frame), MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _mode.frame = CGRectMake(CGRectGetMinX(_mode.frame), CGRectGetMinY(_modeTitle.frame), CGRectGetWidth(_mode.frame), modeSize.height);
    
    CGFloat maxHeight = CGRectGetMaxY(_mode.frame);
    maxHeight = maxHeight> CGRectGetMaxY(_collectBtn.frame)? maxHeight:CGRectGetMaxY(_collectBtn.frame);
    
    _concernView.frame = CGRectMake(CGRectGetMinX(_concernView.frame), maxHeight + spaceSize.height, CGRectGetWidth(_concernView.frame), CGRectGetHeight(_concernView.frame));
    
    [super setFrame:CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetMaxY(_concernView.frame) + spaceSize.height)];
}
 

- (void)listenBtnPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectListenBtn)])
    {
        [self.delegate selectListenBtn];
    }
}

- (void)orderBtnPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectOrderBtn)])
    {
        [self.delegate selectOrderBtn];
    }
}

- (void)collectBtnPressed:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectCollectBtn)])
    {
        [self.delegate selectCollectBtn];
    }
}

@end
