//
//  BaseRestService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-26.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"

@implementation BaseRestService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    if (self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}

@end
