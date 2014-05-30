//
//  FindPWViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "FindPWViewController.h"
#import "LoginService.h"

@interface FindPWViewController ()
{
    LoginService *_loginService;
    NSString *_authCode;
}

@end

@implementation FindPWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initService
{
    _loginService = [[LoginService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"找回密码"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)codeBtnPressed:(id)sender
{
    if (_userName.text == nil || _userName.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入手机号" delegate:nil];
        return;
    }
    _authCode = [_loginService getAuthCodeWithTel:_userName.text];
}

- (IBAction)findBtnPressed:(id)sender
{
    if (_userName.text == nil || _userName.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入手机号" delegate:nil];
        return;
    }
    else if (_pw.text == nil || _pw.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入密码" delegate:nil];
        return;
    }
    else if (_code.text == nil || _code.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"验证码" delegate:nil];
        return;
    }
    else if (![_authCode isEqualToString:_authCode])
    {
        [self showErrorInfoWithMessage:@"验证码输入错误" delegate:nil];
        return;
    }
    
    BOOL result = [_loginService resetPasswordWithTel:_userName.text NewPassword:_pw.text andaAuthCode:_authCode];
    if (result)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
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
