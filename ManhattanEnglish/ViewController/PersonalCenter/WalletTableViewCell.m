//
//  WalletTableViewCell.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "WalletTableViewCell.h"

@implementation WalletTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPersonalID:(PERSONAL_ID)personalID
{
    _personalID = personalID;
    if (_personalID == PERSONAL_TEACHER)
    {
        _content.text = @"您获得了";
    }
    else
    {
        _content.text = @"您消费了";
    }
}

@end
