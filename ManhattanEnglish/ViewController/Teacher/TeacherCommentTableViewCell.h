//
//  TeacherCommentTableViewCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherCommentTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIButton *commentTitle;
@property (nonatomic, weak) IBOutlet UILabel *score;
@property (nonatomic, weak) IBOutlet UILabel *commentContent;
@property (nonatomic, weak) IBOutlet UIButton *infoTitle;
@property (nonatomic, weak) IBOutlet UILabel *areaTitle;
@property (nonatomic, weak) IBOutlet UILabel *area;
@property (nonatomic, weak) IBOutlet UILabel *modeTitle;
@property (nonatomic, weak) IBOutlet UILabel *mode;
@property (nonatomic, weak) IBOutlet UIButton *collectBtn;

@property (nonatomic, weak) IBOutlet UIView *concernView;
@property (nonatomic, weak) IBOutlet UILabel *concernNum;
@property (nonatomic, weak) IBOutlet UILabel *commentNum;
@property (nonatomic, weak) IBOutlet UILabel *collectNum;

@end
