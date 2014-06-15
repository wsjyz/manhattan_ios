//
//  NewAppointViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-3.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@class AppointSearchCondition;

@interface NewAppointViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) AppointSearchCondition *condition;

- (IBAction)searchBtnClick:(id)sender;

@end
