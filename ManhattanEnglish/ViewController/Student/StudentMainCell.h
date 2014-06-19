//
//  StudentMainCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentMainCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UIImageView *headImg;
@property (nonatomic, weak) IBOutlet UIImageView *sexImg;
@property (nonatomic, weak) IBOutlet UILabel *mobile;
@property (nonatomic, weak) IBOutlet UILabel *address;

@end
