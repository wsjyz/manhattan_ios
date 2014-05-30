//
//  OpenWalletService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"

@interface OpenWalletService : BaseRestService

/**
 * 获取钱包余额
 * @param userId
 * @return 当前余额（int）
 */
- (NSUInteger)getBalancesWithUserID:(NSString *)userID;


@end
