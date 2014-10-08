//
//  PayViewController.m
//  ManhattanEnglish
//
//  Created by liujiafei on 14-7-7.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "PayViewController.h"
#import <TbcLibCore/RestServerConfig.h>

@interface PayViewController ()

@end

@implementation PayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RestServerConfig *config = [RestServiceManager config];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", config.baseUrl, @"/payment/payment"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.timeoutInterval = 30;
    [request setValue:@"application/x-www-form-urlencoded"forHTTPHeaderField:@"Content-Type"];
    NSString *body=[NSString stringWithFormat:@"userId=%@&resourceId=%@&resourceType=%@&subject=%@&userName=%@&address=%@&mobile=%@",self.appointment.userId,self.appointment.resourceId,self.appointment.resourceType,self.subject,self.appointment.userName,self.appointment.address,self.appointment.mobile];
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    [_webView loadRequest:request];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
