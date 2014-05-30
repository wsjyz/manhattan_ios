//
//  BaseRestService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-26.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TbcLibCore/RestServiceManager.h>
#import <TbcLibCore/OpenExtension.h>

@interface BaseRestService : NSObject

@property (assign, nonatomic) id<RestServiceDelegate> delegate;

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate;

@end
