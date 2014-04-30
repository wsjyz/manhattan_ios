//
//  WalletTableViewCell.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-4-30.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WalletTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *content;
@property (nonatomic, weak) IBOutlet UILabel *moneyLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

@property (nonatomic, assign) PERSONAL_ID personalID;

@end
