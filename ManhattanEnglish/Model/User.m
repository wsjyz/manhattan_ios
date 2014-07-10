//
//  User.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-5-24.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)avatar
{
    if (_avatar != nil && _avatar.length != 0)
    {
        NSString *foreStr = [_avatar substringToIndex:7];
        if (![foreStr isEqualToString:@"http://"])
        {
            _avatar = [IMG_SERVICE_URL stringByAppendingString:_avatar];
        }
    }
    return _avatar;
}

@end
