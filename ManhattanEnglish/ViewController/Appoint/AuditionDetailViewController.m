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

@interface AuditionDetailViewController () <UITableViewDelegate, SelectionViewDelegate>

@property (strong, nonatomic) AppointService *appointService;
@property (strong, nonatomic) UITableView *tableView;
@property (assign, nonatomic) ConditionTag currentCondition;

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

- (void)initService
{
    self.appointService = [[AppointService alloc] initWithDelegate:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *title = self.isAudition ? @"试听" : @"预约";
    [self setNavgationItemTitle:title];
    [self.auditionBtn setTitle:title forState:UIControlStateNormal];
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
        self.tableView = tableViewCon.tableView;
    }
}

- (void)completeSelection:(SelectionViewController *)viewController
{
    NSArray *selecedItems = viewController.selectedItems;
    NSString *selectedItemStr = selecedItems.count > 0 ? [selecedItems componentsJoinedByString:@","] : @"不限";
    
    AppointConditionTableViewCell *cell = self.tableView.visibleCells[self.currentCondition];
    cell.contentLabel.text = selectedItemStr;
}

#pragma mark -UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return;
    }
    
    NSInteger row = indexPath.row;
    self.currentCondition = row;
    
    SelectionViewController *selectionViewCon = [ViewUtil viewControllerFromNibOfClass:[SelectionViewController class]];
    selectionViewCon.delegate = self;;
    selectionViewCon.contentItems = [self.appointService optionsWithConditionTag:row];
    [self presentViewController:selectionViewCon animated:YES completion:^{
        
        selectionViewCon.selectionTableView.allowsSelection = YES;
        
        // 除了教师性别以外都是多选
        selectionViewCon.selectionTableView.allowsMultipleSelection = row == ConditionTagJsxb ? NO : YES;
    } ];
}

- (IBAction)confirmBtnClick:(id)sender {
    
    
    
}
@end
