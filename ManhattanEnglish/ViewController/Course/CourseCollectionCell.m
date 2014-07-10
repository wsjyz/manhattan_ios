//
//  CourseCollectionCell.m
//  ManhattanEnglish
//
//  Created by Alex on 7/9/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import "CourseCollectionCell.h"

@implementation CourseCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
}

- (void)setChecked:(BOOL)checked
{
    if (self.checked == checked) {
        return;
    }
    
    _checked = checked;
    NSString *imageName = self.checked ? @"publish_course_selected.png" : @"publish_course_empty.png";
    [self.selectionImageView setImage:[UIImage imageNamed:imageName]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
