//
//  PublishCourseTableViewController.m
//  ManhattanEnglish
//
//  Created by Alex on 7/9/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import "PublishCourseTableViewController.h"
#import "CourseCollectionCell.h"
#import "AppointService.h"
#import "CourseService.h"
#import "TeacherDetail.h"
#import "SelectionViewController.h"
#import "AppointConditionTableViewCell.h"
#import <TbcLibCore/StringUtil.h>

@interface PublishCourseTableViewController () <SelectionViewDelegate>

@property (strong, nonatomic) CourseService *courseService;
@property (strong, nonatomic) AppointService *appointService;

@property (assign, nonatomic) ConditionTag currentCondition;

// array with string "0" or "1"
@property (strong, nonatomic) NSMutableArray *courseSelections;

@end

@implementation PublishCourseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initService
{
    self.appointService = [[AppointService alloc] initWithDelegate:self];
    self.courseService = [[CourseService alloc] initWithDelegate:self];
    
    self.detail = [[TeacherDetail alloc] init];
    
    self.courseSelections = [NSMutableArray array];
    for (int i = 0; i < 21; i++) {
        [self.courseSelections addObject:@"0"];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Delegates

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CourseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CourseCollectionCell *cell = (CourseCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.checked = !cell.checked;
    
    NSInteger index = indexPath.row * 3 + indexPath.section;
    self.courseSelections[index] = cell.checked ? @"1" : @"0";
}

#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.detail.classFees = [textField.text floatValue];
}

#pragma mark - SelectionView Delegate

- (void)completeSelection:(SelectionViewController *)viewController
{
    NSString *selectedValueStr = viewController.selectedValueStr;
    NSString *selectedKeyStr = viewController.selectedKeyStr;
    
    switch (self.currentCondition) {
        case ConditionTagJxdd:
            self.teachingAreaLabel.text = [selectedKeyStr isEqualToString: @""] ? @"不限": selectedKeyStr;
            self.detail.teachingArea = selectedValueStr;
            break;
        case ConditionTagJxfs:
            self.tutoringWayLabel.text = [selectedKeyStr isEqualToString: @""] ? @"不限": selectedKeyStr;
            self.detail.tutoringWay = selectedValueStr;
            break;
        case ConditionTagStudentLevel:
            self.studentLevelLabel.text = [selectedKeyStr isEqualToString: @""] ? @"不限": selectedKeyStr;
            self.detail.studentLevel = selectedValueStr;
            break;
        default:
            break;
    }
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        self.currentCondition = ConditionTagJxdd;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        
        self.currentCondition = ConditionTagJxfs;
    }else if (indexPath.section == 2 && indexPath.row == 0){
        
        self.currentCondition = ConditionTagStudentLevel;
    }else{
        
        return;
    }
    
    SelectionViewController *selectionViewCon = [ViewUtil viewControllerFromNibOfClass:[SelectionViewController class]];
    selectionViewCon.delegate = self;;
    selectionViewCon.contentItems = [self.appointService optionsWithConditionTag:self.currentCondition];
    [self presentViewController:selectionViewCon animated:YES completion:^{
        
        selectionViewCon.selectionTableView.allowsSelection = YES;
        
        // 只有授课区域是多选的
        selectionViewCon.selectionTableView.allowsMultipleSelection = self.currentCondition == ConditionTagJxdd ? YES : NO;
    } ];
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

- (IBAction)commitBtnClick:(id)sender {
    
    self.detail.teachingTime = [self.courseSelections componentsJoinedByString:@""];
    
    if ([StringUtil isNullOrEmpty:self.detail.teachingArea]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"请选择授课区域！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
    
    if ([StringUtil isNullOrEmpty:self.detail.tutoringWay]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"请选择授课方式！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
    
    if ([self.detail.teachingTime integerValue] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"请选择授课时间！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
    
    if ([StringUtil isNullOrEmpty:self.detail.studentLevel]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"请选择学员等级！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
    
    if (self.detail.classFees == 0.0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"请填写费用！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
    
    TeacherDetail *detail = [self.courseService postCourse:self.detail];
    if (detail != nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"发布课程成功！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        [self.navigationController popViewControllerAnimated:YES];
        return;
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithMsg:@"发布课程失败！" buttonsType:AlertViewButtonsTypeOk delegate:nil];
        [alert showModal];
        return;
    }
}
@end
