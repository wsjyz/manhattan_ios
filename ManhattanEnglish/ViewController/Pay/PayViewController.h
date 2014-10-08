//
//  PayViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-7-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseViewController.h"
#import "Appointment.h"

@interface Product : NSObject

@end

@interface PayViewController : BaseViewController

@property (strong, nonatomic) Appointment *appointment;
@property (strong, nonatomic) NSString *subject;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
