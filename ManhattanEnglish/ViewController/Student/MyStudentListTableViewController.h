//
//  MyStudentListTableViewController.h
//  ManhattanEnglish
//
//  Created by liujiafei on 14-6-17.
//  Copyright (c) 2014年 8hinfo. All rights reserved.
//

#import "BaseTableViewController.h"

typedef enum
{
    Stu_type_myStu = 0,
    Stu_type_orderStu = 1,
    Stu_type_listenStu
}STU_TYPE;

@interface MyStudentListTableViewController : BaseTableViewController

@property (nonatomic, assign) STU_TYPE stuType;

@end
