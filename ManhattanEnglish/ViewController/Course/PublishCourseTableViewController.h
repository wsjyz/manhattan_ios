//
//  PublishCourseTableViewController.h
//  ManhattanEnglish
//
//  Created by Alex on 7/9/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewController.h"
#import <TbcLibUI/BaseTextField.h>

@class TeacherDetail;

@interface PublishCourseTableViewController : BaseTableViewController

@property (weak, nonatomic) IBOutlet BaseTextField *feeTextField;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *teachingAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *tutoringWayLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentLevelLabel;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@property (strong, nonatomic) TeacherDetail *detail;

- (IBAction)commitBtnClick:(id)sender;

@end
