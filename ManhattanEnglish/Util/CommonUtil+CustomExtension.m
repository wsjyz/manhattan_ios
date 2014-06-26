//
//  CommonUtil+CustomExtension.m
//  ManhattanEnglish
//
//  Created by Alex on 6/27/14.
//  Copyright (c) 2014 8hinfo. All rights reserved.
//

#import "CommonUtil+CustomExtension.h"

@implementation CommonUtil (CustomExtension)

+ (Page *)defaultPage
{
    Page *page = [[Page alloc] init];
    page.autoPaging = NO;
    page.autoCount = NO;
    return page;
}

@end
