//
//  HomeworkSubmit.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeworkSubmit : NSObject

@property (nonatomic, strong) NSString *homeworkSubmitId;
@property (nonatomic, strong) NSString *homeworkId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *homeworkContent;
@property (nonatomic, strong) NSString *submitFile;//服务器上存放的文件名
@property (nonatomic, strong) NSString *originalFileName;//原始文件名
@property (nonatomic, strong) NSString *submitTime;

@end
