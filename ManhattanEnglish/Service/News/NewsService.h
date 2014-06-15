//
//  NewsService.h
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"

@interface NewsService : BaseRestService

// 获取所有动态新闻列表
- (NSArray *)listAllNews;

@end
