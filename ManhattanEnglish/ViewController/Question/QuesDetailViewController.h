//
//  QuesDetailViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"
#import "Question.h"

@protocol QuesDetailDelegate <NSObject>

- (void)deleteQuestion:(Question *)ques;

@end

@interface QuesDetailViewController : BaseViewController

@property (nonatomic, strong) Question *ques;
@property (nonatomic, weak) id<QuesDetailDelegate> delegate;

@end
