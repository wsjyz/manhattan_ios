//
//  NewsDetailViewController.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-5-21.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsDetailViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end
