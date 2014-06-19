//
//  HomeWork.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-19.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeWork : NSObject

@property (nonatomic, strong) NSString *homeworkId;
@property (nonatomic, strong) NSString *homeworkTitle;
@property (nonatomic, strong) NSString *teacherId;
@property (nonatomic, strong) NSString *postTime;  //发布时间
@property (nonatomic, strong) NSString *homeworkFile;      //作业文件
@property (nonatomic, strong) NSString *homeworkContent;
@property (nonatomic, strong) NSString *userId;     //学员Id

@end
