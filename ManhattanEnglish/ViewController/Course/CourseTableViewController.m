//
//  GoodCourseTableViewController.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-20.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "CourseTableViewController.h"
#import "CourseTableViewCell.h"
#import "Course.h"
#import <TbcLibUI/UIImageView+WebCache.h>
#import "CourseDetailViewController.h"
#import "Page.h"

@interface CourseTableViewController ()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation CourseTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setCurrPage:(Page *)currPage
{
    _currPage = currPage;
    
    if (currPage != nil && currPage.rows != nil) {
        self.rows = currPage.rows;
        
        [self.tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [ViewUtil viewFromNibOfClass:[CourseTableViewCell class] owner:self];
    }
    
    // Configure the cell...
    Course *course = self.rows[indexPath.row];
    [cell.courseImageView setImageWithURL:[NSURL URLWithString:course.coursePic] placeholderImage:[UIImage imageNamed:@"good_course_cover_bg.png"]];
    cell.courseTitleLabel.text = course.classNo;
    cell.coursePriceLabel.text = [NSString stringWithFormat:@"%0.0f", course.expense];
    cell.coursePlaceLabel.text = course.place;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Course *course = self.rows[path.row];
    
    CourseDetailViewController *detailViewCon = [segue destinationViewController];
    detailViewCon.course = course;
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end