//
//  FindPWViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface FindPWViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *pw;
@property (weak, nonatomic) IBOutlet UITextField *code;

- (IBAction)codeBtnPressed:(id)sender;
- (IBAction)findBtnPressed:(id)sender;

@end
