//
//  QuesDetailTableViewCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuesDetailTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *quesTypeLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;
@property (nonatomic, weak) IBOutlet UILabel *content;
@property (nonatomic, weak) IBOutlet UIImageView *contentImg;
@property (nonatomic, weak) IBOutlet UILabel *answerTeacher;
@property (nonatomic, weak) IBOutlet UILabel *answerName;

@end
