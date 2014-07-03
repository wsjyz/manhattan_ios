//
//  TeacherHomeWorkViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface TeacherHomeWorkViewController : BaseViewController

@property (nonatomic, weak) IBOutlet BaseTextView *homeworkContent;
@property (nonatomic, weak) IBOutlet UIButton *sendHKbtn;

- (IBAction)sendHomework:(id)sender;

@end
