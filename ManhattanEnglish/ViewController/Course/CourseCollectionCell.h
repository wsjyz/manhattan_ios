//
//  CourseCollectionCell.h
//  ManhattanEnglish
//
//  Created by Alex on 7/9/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *selectionImageView;
@property (assign, nonatomic) BOOL checked;

@end
