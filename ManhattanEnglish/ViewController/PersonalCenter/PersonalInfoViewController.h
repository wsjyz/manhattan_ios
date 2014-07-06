//
//  PersonalInfoViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-29.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"
#import "User.h"

@interface PersonalInfoViewController : BaseViewController

@property (nonatomic, retain) User *user;
@property (nonatomic, assign) PERSONAL_ID personID;

@end
