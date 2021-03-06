//
//  MyAppointViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-18.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@class CourseTableViewController;

@interface MyAppointViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIView *courseInnerView;
@property (weak, nonatomic) IBOutlet UIView *teacherInnerView;
@property (weak, nonatomic) IBOutlet UIView *studentInnerVIew;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentValueChanged:(id)sender;

@end
