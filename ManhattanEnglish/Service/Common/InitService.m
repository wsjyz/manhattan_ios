//
//  InitService.m
//  CloudStudy2
//
//  Created by Tianyu Tan on 13-4-24.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import "InitService.h"
#import <TbcLibCore/RestServerConfig.h>
#import <TbcLibCore/RestServiceManager.h>

@interface InitService (PrivateMethods)

//- (void)initDatabase;

- (void)initOpenSetting;

@end



@implementation InitService (PrivateMethods)

- (void)initOpenSetting
{
    RestServerConfig *config = [[RestServerConfig alloc] init];
    config.baseUrl = @"http://203.195.131.34:8080/mhd";
    config.debugMode = YES;
    [RestServiceManager initConfig:config];
}

@end


@implementation InitService


- (void)initAll
{
    // init db
//    [self initDatabase];
    
    // init open setting
    [self initOpenSetting];
}

@end
