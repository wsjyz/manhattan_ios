//
//  SelectionTableViewCell.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-14.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "SelectionTableViewCell.h"

@implementation SelectionTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    self.accessoryType = selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
}

@end
