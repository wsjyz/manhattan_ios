//
//  TimespanPickerViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-13.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "TimespanPickerViewController.h"
#import <TbcLibCore/CommonUtil.h>

#define DATE_PICKER_BG_COLOR    [UIColor colorWithRed:58.0/255.0 green:58.0/255.0 blue:58.0/255.0 alpha:1.0]

@interface TimespanPickerViewController () <UITextFieldDelegate>

@property (weak, nonatomic) UITextField *refTextField;

@end

@implementation TimespanPickerViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.datePicker.backgroundColor = DATE_PICKER_BG_COLOR;
    self.datePicker.hidden = YES;
    
    if (!self.rangeSelection) {
        self.endDateTextField.hidden = YES;
    }
    
    [self updateDateWithTextFiled:self.startDateTextField];
    [self updateDateWithTextFiled:self.endDateTextField];
}

- (void)updateDateWithTextFiled:(UITextField *)textField
{
    textField.text = [CommonUtil stringWithDate:self.datePicker.date andFormatStr:yyyy_MM_dd];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.datePicker.hidden) {
        [self updateDateWithTextFiled:self.refTextField];
        self.datePicker.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    if (self.datePicker.hidden) {
        
        self.refTextField = textField;
        self.datePicker.hidden = NO;
    }else{
    
        if (self.refTextField != nil) {
            [self updateDateWithTextFiled:self.refTextField];
        }
        self.datePicker.hidden = YES;
    }
    
    return NO;
}

- (IBAction)completeBtnClick:(id)sender {
    
    [self updateDateWithTextFiled:self.refTextField];
    
    self.startDate = [CommonUtil dateWithString:self.startDateTextField.text withFormatStr:yyyy_MM_dd];
    self.endDate = [CommonUtil dateWithString:self.endDateTextField.text withFormatStr:yyyy_MM_dd];
    
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.delegate != nil) {
            [self.delegate complete:self];
        }
    }];
}
@end
