//
//  AuditionDetailViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "AuditionDetailViewController.h"
#import "SelectionViewController.h"
#import "AppointService.h"
#import "AppointConditionTableViewCell.h"
#import "ContactInfoTableViewCell.h"
#import "TeacherDetail.h"
#import "Course.h"
#import "Option.h"
#import "Appointment.h"
#import "PayViewController.h"

@interface AuditionDetailViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, SelectionViewDelegate>

@property (strong, nonatomic) AppointService *appointService;
@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) ConditionTag currentCondition;

@property (strong, nonatomic) NSDictionary *cellPropValues;
@property (strong, nonatomic) NSArray *contactLabelTitles;

@property (strong, nonatomic) Appointment *appointment;

@end

@implementation AuditionDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initCellPropValueDic
{
    self.cellPropValues = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"appoint_kcfl, 课程分类", @(ConditionTagKcfl),
                           @"appoint_jxdd, 教学地点", @(ConditionTagJxdd), nil];
    
    self.contactLabelTitles = [NSArray arrayWithObjects:@"联系人", @"联系地址", @"手机号", nil];
}

- (void)initService
{
    self.appointService = [[AppointService alloc] initWithDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSString *title = self.isAudition ? @"试听" : @"预约";
    [self setNavgationItemTitle:title];
    [self.auditionBtn setTitle:title forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initCellPropValueDic];
    self.appointment = [[Appointment alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([@"innerTable" isEqualToString:segue.identifier]) {
        
        UITableViewController *tableViewCon = segue.destinationViewController;
        tableViewCon.tableView.delegate = self;
        tableViewCon.tableView.dataSource = self;
        self.tableView = tableViewCon.tableView;
    }
}

- (void)completeSelection:(SelectionViewController *)viewController
{
    NSString *selectedValueStr = viewController.selectedValueStr;
    NSString *selectedKeyStr = viewController.selectedKeyStr;
    
    AppointConditionTableViewCell *cell = self.tableView.visibleCells[self.currentCondition];
    cell.contentLabel.text = [selectedKeyStr isEqualToString: @""] ? @"不限": selectedKeyStr;
    
    // TODO: can not found prop 课程分类 区域
    switch (self.currentCondition) {
        case ConditionTagKcfl:
            self.appointment.courseCategory = selectedValueStr;
            break;
        case ConditionTagJxdd:
            self.appointment.address = selectedValueStr;
            break;
        default:
            break;
    }
}

#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    switch (textField.tag) {
        case 0:
            // TODO: no found prop 联系人
            break;
        case 1:
            self.appointment.address = textField.text;
            break;
        case 2:
            self.appointment.mobile = textField.text;
            break;
    }
}

#pragma mark - UITableView Delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return @"  ";
    }
    
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.isTeacher ? 2 : 0;
    }else if (section == 1){
        return 3;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSString *cellId = [NSString stringWithFormat:@"SectionCell%d", section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    if (section == 0) {
        
        AppointConditionTableViewCell *cell1 = (AppointConditionTableViewCell *)cell;
        // Configure the cell...
        NSNumber *cellKey   = @(indexPath.row);
        NSString *value     = self.cellPropValues[cellKey];
        NSArray  *valArr    = [value componentsSeparatedByString:@","];
        NSString *imageName = valArr[0];
        NSString *name = valArr[1];
        
        cell1.iconImageView.image = [UIImage imageNamed:imageName];
        cell1.nameLabel.text = name;
        
    }else if (section == 1){
        
        ContactInfoTableViewCell *cell2 = (ContactInfoTableViewCell *)cell;
        cell2.textField.delegate = self;
        cell2.titleLabel.text = self.contactLabelTitles[indexPath.row];
        cell2.textField.tag = indexPath.row;
    }else{
        
    }
    
    return cell;
}

- (NSArray *)optionsFromTeacherDetailWithTag:(ConditionTag)tag
{
    if (self.teacherDetail == nil) {
        return [NSArray array];
    }
    
    NSArray *options = [NSArray array];
    
    if (tag == ConditionTagKcfl) {
        NSArray *optionValues = [self.teacherDetail.courseCategory componentsSeparatedByString:@","];
        options = [Option optionsWithSameTextAndValues:optionValues];
    }else if (tag == ConditionTagJxdd){
        NSArray *optionValues = [self.teacherDetail.teachingArea componentsSeparatedByString:@","];
        options = [Option optionsWithSameTextAndValues:optionValues];
    }else{
    }
    
    return options;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return;
    }
    
    NSInteger row = indexPath.row;
    self.currentCondition = row;
    
    SelectionViewController *selectionViewCon = [ViewUtil viewControllerFromNibOfClass:[SelectionViewController class]];
    selectionViewCon.delegate = self;;
    selectionViewCon.contentItems = [self optionsFromTeacherDetailWithTag:row];
    [self presentViewController:selectionViewCon animated:YES completion:^{
        
        selectionViewCon.selectionTableView.allowsSelection = YES;
        
        // 除了教师性别以外都是多选
        selectionViewCon.selectionTableView.allowsMultipleSelection = row == ConditionTagJsxb ? NO : YES;
    } ];
}

- (IBAction)confirmBtnClick:(id)sender {
    
    // 添加记录
//    [self.appointService addAppointment:appointment];
    PayViewController *payVC = [[PayViewController alloc] init];
    [self.navigationController pushViewController:payVC animated:YES];
}
@end
