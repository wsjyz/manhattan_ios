//
//  Wallet.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wallet : NSObject

@property (nonatomic, strong) NSString *walletId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, assign) NSUInteger *money;
@property (nonatomic, strong) NSString *payStatus;
@property (nonatomic, strong) NSDate *optTime;

@end
