//
//  WalletService.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseRestService.h"

@interface WalletService : BaseRestService

//获取钱包余额
- (NSUInteger)getBalancesWithUserID:(NSString *)userID;

@end
