//
//  OpenWalletService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "OpenWalletService.h"

@implementation OpenWalletService

/**
 * 获取钱包余额
 * @param userId
 * @return 当前余额（int）
 */
- (NSUInteger)getBalancesWithUserID:(NSString *)userID
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     userID, @"userId",nil];
    return [[RestServiceManager performRequestWithPath:OpenWalletService_getBalances paramDic:paramDic returnType:@(@encode(NSUInteger)) delegate:self.delegate] integerValue];
}


@end
