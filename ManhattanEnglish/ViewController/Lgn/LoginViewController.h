//
//  LoginViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
{
    BOOL _autoLogin;
}

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIImageView *checkImg;

@property (nonatomic, assign) BOOL isLogout;

- (IBAction)autoLoginCheckbtnPressed:(id)sender;
- (IBAction)loginBtnPressed:(id)sender;

@end
