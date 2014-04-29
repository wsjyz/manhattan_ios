//
//  LoginViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    BOOL _checked;
}

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"登录"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnPressed:(id)sender
{
    if (_userName.text == nil || _userName.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入手机号" delegate:nil];
    }
    else if (_password.text == nil || _password.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入密码" delegate:nil];
    }
    
}

- (IBAction)autoLoginCheckbtnPressed:(id)sender
{
    _checked = !_checked;
    [self updateCheckImageView];
}

- (void)updateCheckImageView
{
    if (_checked)
    {
        _checkImg.image = [UIImage imageNamed:@"ok.png"];
    }
    else
    {
        _checkImg.image = [UIImage imageNamed:@"no.png"];
    }
}

#pragma mark UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0,-CGRectGetMinY(_userName.frame)+BAR_HEIGHT + STATUS_BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, BAR_HEIGHT, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    }];
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
