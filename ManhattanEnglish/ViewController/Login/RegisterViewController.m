//
//  RegisterViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

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
            break;
        }
        default:
        {
            [_stuBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_n.png"] forState:UIControlStateNormal];
            [_teacherBtn setBackgroundImage:[UIImage imageNamed:@"register_btn_p.png"] forState:UIControlStateNormal];
            _VIPBtn.hidden = YES;
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
    
}

- (IBAction)registerBtnPressed:(id)sender
{
    if (_userName.text == nil || _userName.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入手机号" delegate:nil];
    }
    else if (_password.text == nil || _password.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"请输入密码" delegate:nil];
    }
    else if (_code.text == nil || _code.text.length == 0)
    {
        [self showErrorInfoWithMessage:@"验证码" delegate:nil];
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
