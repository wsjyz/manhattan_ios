//
//  NodataBgView.m
//  CloudStudySeal
//
//  Created by Tianyu Tan on 13-7-6.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import "NodataBgView.h"
#import "ViewUtil.h"

#define VIEW_MARGIN                           5.0

@implementation NodataBgView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    CGFloat totalHeight = (self.centerImageView.height + self.centerLabel.height);
    CGFloat startY = self.superview.height / 2 - totalHeight;
    CGFloat midX = self.superview.width / 2;
    
    // reset frame of image and label
    CGRect newImageFrame = self.centerImageView.frame;
    newImageFrame.origin.x = midX - self.centerImageView.width / 2;
    newImageFrame.origin.y = startY;
    self.centerImageView.frame = newImageFrame;

    CGRect newLabelFrame = self.centerLabel.frame;
    newLabelFrame.origin.x = midX - self.centerLabel.width / 2;
    newLabelFrame.origin.y = startY + VIEW_MARGIN + self.centerImageView.height;
    self.centerLabel.frame = newLabelFrame;
}

@end
