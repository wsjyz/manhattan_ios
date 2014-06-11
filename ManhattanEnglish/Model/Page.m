//
//  Page.m
//  CloudStudySeal
//
//  Created by iAlexsander on 2013-06-24.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import "Page.h"

@implementation Page

- (id)init
{
    self = [super init];
    if (self)
    {
        _pageNo = DEFAULT_PAGE_NO;
        _pageSize = DEFAULT_PAGE_SIZE;
        _autoCount = DEFAULT_AUTO_COUNTING;
        _autoPaging = DEFAULT_AUTO_PAGING;
    }
    return self;
}

#pragma mark - Custom Properties

- (NSUInteger)firstInCurrPage
{
    return ((self.pageNo - 1) * self.pageSize) + 1;
}

- (NSUInteger)totalPages
{
    long count = self.total / self.pageSize;
    if (self.total % self.pageSize > 0) {
        count++;
    }
    return count;
}

- (BOOL)hasNextPage
{
    return (self.pageNo + 1 <= self.totalPages);
}

- (BOOL)hasPrePage
{
    return (self.pageNo - 1 >= 1);
}

- (NSUInteger)nextPage
{
    if (self.hasNextPage) {
        return self.pageNo + 1;
    } else {
        return self.pageNo;
    }
}

- (NSUInteger)prePage
{
    if (self.hasPrePage) {
        return self.pageNo - 1;
    } else {
        return self.pageNo;
    }
}

@end