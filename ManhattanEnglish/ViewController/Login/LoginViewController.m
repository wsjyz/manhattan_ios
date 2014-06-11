//
//  LoginViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginService.h"
#import "CommonService.h"
#import "User.h"

@interface LoginViewController ()
{
    BOOL _checked;
    LoginService *_loginService;
    CommonService *_commonService;
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

- (void)initService
{
    _loginService = [[LoginService alloc] initWithDelegate:self];
    _commonService = [[CommonService alloc] initWithDelegate:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_isFirstLogin)
    {
        _checked = YES;
        [self updateCheckImageView];
        _autoLogin = YES;
        return;
    }
    
    _autoLogin = NO;
    NSString *lastLoginMobile = [_commonService getLastLoginMobile];
    if (lastLoginMobile == nil)
    {
        return;
    }
    
    _checked = [_commonService getLoginCheckBox];
    [self updateCheckImageView];
    self.userName.text = lastLoginMobile;

    if (_checked)
    {
        self.password.text = [_commonService getLastLoginUserPassword];
        _autoLogin = YES;
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"登录"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ((_autoLogin && !_isLogout) || (_autoLogin && _isFirstLogin))
    {
        [self loginWithMobile:self.userName.text Password:self.password.text];
    }
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
        return;
    }
    else if (_password.text == nil || _password.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入密码" delegate:nil];
        return;
    }
    else
    {
        [self loginWithMobile:_userName.text Password:_password.text];
    }
    
}

//登录
- (void)loginWithMobile:(NSString *)mobile Password:(NSString *)password
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:hud];
    hud.labelText = @"登录中...";
    
    __block User *user;
    [hud showAnimated:YES whileExecutingBlock:^{
        user = [_loginService remoteLoginWithMobile:mobile andPassword:password];
    } completionBlock:^{
        if (user)
        {
            //登录成功
            [_commonService saveAndUpdateLastLoginMobile:mobile Password:password];
            [_commonService saveAndUpdateLastLoginCheckBox:_checked];
            [_commonService updateCurrentUser:user];
        }
        [hud removeFromSuperview];
    }];
    if (user)
    {
        [self.navigationController popViewControllerAnimated:YES];
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
