//
//  Page.h
//  CloudStudySeal
//
//  Created by iAlexsander on 2013-06-24.
//  Copyright (c) 2013年 Tbc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_PAGE_NO             1
#define DEFAULT_PAGE_SIZE           20
#define DEFAULT_AUTO_COUNTING       YES
#define DEFAULT_AUTO_PAGING         YES


@interface Page : NSObject

/*
 * 页码
 */
@property (assign, nonatomic) NSUInteger pageNo;

/*
 * 每页的记录数
 */
@property (assign, nonatomic) NSUInteger pageSize;

/*
 * 
 */
@property (assign, nonatomic) BOOL autoCount;

/*
 * 
 */
@property (assign, nonatomic) BOOL autoPaging;

/*
 * 查询结果
 */
@property (strong, nonatomic) NSMutableArray *rows;

/*
 * 总记录数
 */
@property (assign, nonatomic) long long total;

/************************* Custom Properties **************************/

/*
 * 根据pageNo和pageSize计算当前页第一条记录在总结果集中的位置,序号从1开始
 */
@property (assign, nonatomic, readonly) NSUInteger firstInCurrPage;

/*
 * 根据pageSize与totalCount计算总页数.
 */
@property (assign, nonatomic, readonly) NSUInteger totalPages;

/*
 * 取得下页的页号, 序号从1开始.
 * 当前页为尾页时仍返回尾页序号.
 */
@property (assign, nonatomic, readonly) BOOL hasNextPage;

/*
 * 取得上页的页号, 序号从1开始.
 * 当前页为首页时返回首页序号.
 */
@property (assign, nonatomic, readonly) BOOL hasPrePage;

/*
 * 是否还有上一页.
 */
@property (assign, nonatomic, readonly) NSUInteger nextPage;

/*
 * 是否还有下一页.
 */
@property (assign, nonatomic, readonly) NSUInteger prePage;

@end



