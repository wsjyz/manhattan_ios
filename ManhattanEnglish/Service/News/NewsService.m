//
//  NewsService.m
//  ManhattanEnglish
//
//  Created by Tianyu Tan on 14-6-15.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "NewsService.h"
#import "News.h"
#import "Page.h"
#import <TbcLibCore/CommonUtil.h>

@implementation NewsService (OpenExtension)

- (Page *)getInformations
{
    Page *page = [CommonUtil defaultPage];
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     OPENVALUE(page), @"openPage", nil];
    [ReflectionUtil setArrayType:NSStringFromClass([News class]) forPropName:@"rows" ofClassName:NSStringFromClass([Page class])];
    return [RestServiceManager performRequestWithPath:@"/info/getInformations" paramDic:paramDic returnType:NSStringFromClass([Page class]) delegate:self.delegate];
}

@end

@implementation NewsService

- (NSArray *)listAllNews
{
    News *news1 = [[News alloc] init];
    news1.title = @"新概念英语第一册";
    news1.postTime = [CommonUtil dateWithString:@"2013-12-21 23:12:50" withFormatStr:yyyy_MM_dd_HH_mm_ss];
    news1.content = @"《新概念英语》（New Concept English）作为享誉全球的最为经典地道的英语教材，以其严密的体系性、严谨的科学性、精湛的实用性、浓郁的趣味性深受英语学习者的青睐，新概念英语一册(英语初阶)基础班---- 学习英语的敲门砖（First Things First）讲练基本语音、语调（包括所有的音标、连读、同化）及英语中的基本语法、词法、句法及句型结构知识。学好第一册，是练好英语基本功的关键，适合于英语基础差，欲在短期内掌握英语基础的学习者。掌握后，可以参加中考一类考试。tingroom不仅为网友提供新概念英语第一册在线收听，还汇总了自学导读、课堂笔记、语法以及单词学习。 ";
    
    News *news2 = [[News alloc] init];
    news2.title = @"新概念英语第二册";
    news2.postTime = [CommonUtil dateWithString:@"2014-2-21 23:00:00" withFormatStr:yyyy_MM_dd_HH_mm_ss];
    news2.content = @"《新概念英语》2";
    
    News *news3 = [[News alloc] init];
    news3.title = @"新概念英语第三册";
    news3.postTime = [CommonUtil dateWithString:@"2014-3-6 10:00:50" withFormatStr:yyyy_MM_dd_HH_mm_ss];
    news3.content = @"《新概念英语》3";
    
    return @[news1, news2, news3];
}

@end
