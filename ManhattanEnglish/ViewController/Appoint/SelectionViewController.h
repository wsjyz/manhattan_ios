//
//  SelectionTableViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-14.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectionViewController;

@protocol SelectionViewDelegate <NSObject>

@required
- (void)completeSelection:(SelectionViewController *)viewController;

@end

@interface SelectionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *selectionTableView;
@property (weak, nonatomic) id<SelectionViewDelegate> delegate;

@property (strong, nonatomic) NSArray *contentItems;
@property (strong, nonatomic, readonly) NSArray *selectedItems;
@property (strong, nonatomic, readonly) NSString *selectedValueStr;

- (IBAction)completeBtnClick:(id)sender;

@end
