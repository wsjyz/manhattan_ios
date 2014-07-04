//
//  CourseHeaderView.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-16.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AuditionDetailDelegate <NSObject>

@required
- (void)auditionBtnClick;
- (void)appointBtnClick;

@end

@interface CourseHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *courseImageView;
@property (weak, nonatomic) IBOutlet UILabel *classNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *endDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *periodLabel;

@property (weak, nonatomic) id<AuditionDetailDelegate> delegate;

- (IBAction)auditionBtnClick:(id)sender;
- (IBAction)appointBtnClick:(id)sender;

@end
