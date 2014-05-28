//
//  RegisterViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginService.h"
#import "CommonService.h"

@interface RegisterViewController ()
{
    LoginService *_loginService;
    CommonService *_commonService;
    NSString *_type;
    NSString *_authCode;
}

@end

@implementation RegisterViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavgationItemTitle:@"注册"];
    
    self.peopleType = STUDENT_TYPE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPeopleType:(PeopleType)peopleType
{
    switch (peopleType) {
        case STUDENT_TYPE:
        {
            [_stuBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_p.png"] forState:UIControlStateNormal];
            [_teacherBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_n.png"] forState:UIControlStateNormal];
            _VIPBtn.hidden = NO;
            _type = TYPE_STUDENT;
            break;
        }
        default:
        {
            [_stuBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_n.png"] forState:UIControlStateNormal];
            [_teacherBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_p.png"] forState:UIControlStateNormal];
            _VIPBtn.hidden = YES;
            _type = TYPE_TEACHER;
            break;
        }
    }
}

- (IBAction)stuBtnPressed:(id)sender
{
    self.peopleType = STUDENT_TYPE;
}

- (IBAction)teacherBtnPressed:(id)sender
{
    self.peopleType = TEACHER_TYPE;
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

- (IBAction)registerBtnPressed:(id)sender
{
    NSString *mobile = _userName.text;
    NSString *pw = _password.text;
    NSString *authCode = _code.text;
    
    if (mobile == nil || mobile.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入手机号" delegate:nil];
        return;
    }
    else if (pw == nil || pw.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入密码" delegate:nil];
        return;
    }
    else if (authCode == nil || authCode.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入验证码" delegate:nil];
        return;
    }
    else if (![authCode isEqualToString:_authCode])
    {
        [self showErrorInfoWithMessage:@"验证码输入错误" delegate:nil];
        return;
    }
    
   BOOL result = [_loginService registerWithMobile:mobile Password:pw AuthCode:authCode andType:_type];
    if (result)
    {
        //注册成功
        [self registerSuccessDone];
    }
}

- (void)registerSuccessDone
{
    switch (self.peopleType) {
        case STUDENT_TYPE:
        {
            [_commonService saveAndUpdateLastLoginMobile:_userName.text Password:_password.text];
            [_commonService saveAndUpdateLastLoginCheckBox:YES];
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case TEACHER_TYPE:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请前往网站继续完成认证" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            break;
        }
            
        default:
            break;
    }
}

- (IBAction)VIPBtnPressed:(id)sender
{
    
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
