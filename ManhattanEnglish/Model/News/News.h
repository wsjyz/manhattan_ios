//
//  News.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (strong, nonatomic) NSString *informationId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSDate *postTime;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSString *status;

@end
