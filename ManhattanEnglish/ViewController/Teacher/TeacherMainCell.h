//
//  TeacherMainCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-5.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherMainCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *name;
@property (nonatomic, weak) IBOutlet UIImageView *headImg;
@property (nonatomic, weak) IBOutlet UIImageView *sexImg;
@property (nonatomic, weak) IBOutlet UILabel *school;
@property (nonatomic, weak) IBOutlet UILabel *subject;
@property (nonatomic, weak) IBOutlet UIImageView *arrowImg;

@end
