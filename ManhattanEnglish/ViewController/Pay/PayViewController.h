//
//  PayViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-7-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"
#import "AlixLibService.h"

@interface Product : NSObject
{
    SEL _result;
}

@end

@interface PayViewController : BaseViewController

@property (nonatomic,assign) SEL result;//这里声明为属性方便在于外部传入。

-(void)paymentResult:(NSString *)result;

@end
