//
//  WeekDayTableViewController.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/22/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCWeekDayTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *dayTableview;
@property (nonatomic,strong)  NSMutableArray* weekdays;

@end
