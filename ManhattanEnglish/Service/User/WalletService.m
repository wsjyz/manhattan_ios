//
//  WalletService.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "WalletService.h"
#import "OpenWalletService.h"

@interface WalletService ()
{
    OpenWalletService *_walletService;
}

@end

@implementation WalletService

- (id)initWithDelegate:(id<RestServiceDelegate>)delegate
{
    self = [super initWithDelegate:delegate];
    if (self)
    {
        _walletService = [[OpenWalletService alloc] initWithDelegate:delegate];
    }
    return self;
}

//获取钱包余额
- (NSUInteger)getBalancesWithUserID:(NSString *)userID
{
    return [_walletService getBalancesWithUserID:userID];
}

//消费记录
- (NSArray *)getMoneyRecordsWithUserID:(NSString *)userID
{
    //TODO:
    return nil;
}

@end
