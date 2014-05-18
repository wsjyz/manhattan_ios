//
//  PrepareViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrepareViewController : UIViewController

- (IBAction)loginBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *personIdSegControl;

@end
