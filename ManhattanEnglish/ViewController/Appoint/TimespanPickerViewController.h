//
//  TimespanPickerViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-13.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TimespanPickerViewController;

@protocol TimespanPickerDelegate <NSObject>

@required
- (void)complete:(TimespanPickerViewController *)viewController;

@end


@interface TimespanPickerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;

@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;

@property (strong, nonatomic) NSDate *startDate;

@property (strong, nonatomic) NSDate *endDate;

@property (weak, nonatomic) id<TimespanPickerDelegate> delegate;

- (IBAction)completeBtnClick:(id)sender;

@end
