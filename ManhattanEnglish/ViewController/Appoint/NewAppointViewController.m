//
//  NewAppointViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-3.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "NewAppointViewController.h"
#import "AppointConditionTableViewCell.h"

@interface NewAppointViewController () <UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) NSDictionary *cellPropValues;

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
                           @"appoint_kcfl,课程分类", @(0),
                           @"appoint_jxdd,教学地点", @(1),
                           @"appoint_jxfs,教学方式", @(2),
                           @"appoint_jsxb,教师性别", @(3),
                           @"appoint_yyrq,预约日期", @(4), nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCellPropValueDic];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegates

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select");
    
//    UIPickerView *pickerView = [[UIPickerView alloc] init];
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:nil
                                                      delegate:self
                                             cancelButtonTitle:@"Done"
                                        destructiveButtonTitle:@"Cancel"
                                             otherButtonTitles:nil];
    UIDatePicker *dataPicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 135, 320, 150)];
    dataPicker.datePickerMode = UIDatePickerModeDate;
    dataPicker.backgroundColor = [UIColor lightGrayColor];
    [menu addSubview:dataPicker];
    [menu showInView:self.view];
    [menu setBounds:CGRectMake(0,0,320, 400)];
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
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (BOOL)hidesBottomBar
{
    return YES;
}

@end
