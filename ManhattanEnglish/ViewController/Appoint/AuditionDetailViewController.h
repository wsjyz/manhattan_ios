//
//  AuditionDetailViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface AuditionDetailViewController : BaseViewController

@property (assign, nonatomic) BOOL isAudition;

@property (weak, nonatomic) IBOutlet UIButton *auditionBtn;

- (IBAction)confirmBtnClick:(id)sender;

@end
