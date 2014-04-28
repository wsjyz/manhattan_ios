//
//  RegisterViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-27.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

typedef enum
{
    STUDENT_TYPE = 0,
    TEACHER_TYPE
}PeopleType;

@interface RegisterViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UIButton *stuBtn;
@property (weak, nonatomic) IBOutlet UIButton *teacherBtn;
@property (weak, nonatomic) IBOutlet UIImageView *faceImg;
@property (weak, nonatomic) IBOutlet UIButton *VIPBtn;

@property (nonatomic, assign) PeopleType peopleType;

- (IBAction)stuBtnPressed:(id)sender;
- (IBAction)teacherBtnPressed:(id)sender;
- (IBAction)codeBtnPressed:(id)sender;
- (IBAction)registerBtnPressed:(id)sender;
- (IBAction)VIPBtnPressed:(id)sender;

@end
