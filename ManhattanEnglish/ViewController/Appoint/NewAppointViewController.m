//
//  NewAppointViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-3.
//  Copyright (c) 2014年 ;. All rights reserved.
//

#import "NewAppointViewController.h"
#import "AppointConditionTableViewCell.h"
#import "TimespanPickerViewController.h"
#import "SelectionViewController.h"
#import "ViewUtil.h"
#import <TbcLibCore/CommonUtil.h>
#import "AppointService.h"
#import "AppointSearchCondition.h"
#import "CourseTableViewController.h"

#define APPOINT_DATE_FORMAT         @"%@~%@"

@interface NewAppointViewController () <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate, TimespanPickerDelegate, SelectionViewDelegate>

@property (strong, nonatomic) AppointService *appointService;

@property (assign, nonatomic) ConditionTag currentCondition;
@property (strong, nonatomic) NSDictionary *cellPropValues;
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation NewAppointViewController

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
                           @"appoint_kcfl,课程分类", @(ConditionTagKcfl),
                           @"appoint_jxdd,教学地点", @(ConditionTagJxdd),
                           @"appoint_jxfs,教学方式", @(ConditionTagJxfs),
                           @"appoint_jsxb,教师性别", @(ConditionTagJsxb),
                           @"appoint_yyrq,预约日期", @(ConditionTagYyrq), nil];
}

- (void)initService
{
    self.appointService = [[AppointService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCellPropValueDic];
    
    self.condition = [[AppointSearchCondition alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegates

- (void)complete:(TimespanPickerViewController *)viewController
{
    AppointConditionTableViewCell *cell = self.tableView.visibleCells[4];
    NSString *startDateStr = [CommonUtil stringWithDate:viewController.startDate andFormatStr:yyyy_MM_dd];
    NSString *endDateStr = [CommonUtil stringWithDate:viewController.endDate andFormatStr:yyyy_MM_dd];
    cell.contentLabel.text = [NSString stringWithFormat:APPOINT_DATE_FORMAT, startDateStr, endDateStr];
    
    self.condition.startDate = viewController.startDate;
    self.condition.endDate = viewController.endDate;
}

- (void)completeSelection:(SelectionViewController *)viewController
{
    NSArray *selecedItems = viewController.selectedItems;
    NSString *selectedItemStr = selecedItems.count > 0 ? [selecedItems componentsJoinedByString:@","] : @"不限";
    
    AppointConditionTableViewCell *cell = self.tableView.visibleCells[self.currentCondition];
    cell.contentLabel.text = selectedItemStr;
    
    switch (self.currentCondition) {
        case ConditionTagKcfl:
            self.condition.kcfl = selecedItems;
            break;
        case ConditionTagJxdd:
            self.condition.jxdd = selecedItems;
            break;
        case ConditionTagJxfs:
            self.condition.jxfs = selecedItems;
            break;
        case ConditionTagJsxb:
            self.condition.jsxb = selecedItems[0];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    self.currentCondition = row;
    
    if (row == ConditionTagYyrq) {
        TimespanPickerViewController *pickerView = [ViewUtil viewControllerFromNibOfClass:[TimespanPickerViewController class]];
        pickerView.delegate = self;
        [self presentViewController:pickerView animated:YES completion:nil];
    }else{
        SelectionViewController *selectionViewCon = [ViewUtil viewControllerFromNibOfClass:[SelectionViewController class]];
        selectionViewCon.delegate = self;;
        selectionViewCon.contentItems = [self.appointService optionsWithConditionTag:row];
        [self presentViewController:selectionViewCon animated:YES completion:^{
            
            selectionViewCon.selectionTableView.allowsSelection = YES;
            
            // 除了教师性别以外都是多选
            selectionViewCon.selectionTableView.allowsMultipleSelection = row == ConditionTagJsxb ? NO : YES;
        } ];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppointConditionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSNumber *cellKey   = @(indexPath.row);
    NSString *value     = self.cellPropValues[cellKey];
    NSArray  *valArr    = [value componentsSeparatedByString:@","];
    NSString *imageName = valArr[0];
    NSString *name = valArr[1];
    
    cell.iconImageView.image = [UIImage imageNamed:imageName];
    cell.nameLabel.text = name;
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"innerTableView"]) {
        UITableViewController *innerTableViewController = segue.destinationViewController;
        innerTableViewController.tableView.delegate = self;
        innerTableViewController.tableView.dataSource = self;
        self.tableView = innerTableViewController.tableView;
    }else if ([segue.identifier isEqualToString:@"goodCourse"]){
        
        NSArray *courses = [self.appointService findCourseWithAppointSearchCondition:self.condition];
        CourseTableViewController *goodCourseViewCon = segue.destinationViewController;
        goodCourseViewCon.courses = courses;
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (BOOL)hidesBottomBar
{
    return YES;
}

- (IBAction)searchBtnClick:(id)sender {
    [self performSegueWithIdentifier:@"goodCourse" sender:self];
}
@end
