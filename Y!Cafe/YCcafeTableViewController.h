//
//  cafeTableViewController.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/22/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YCMenuViewController;

@interface YCcafeTableViewController : UITableViewController
@property (nonatomic,strong)  NSMutableArray *cafeteria;
@property (nonatomic,strong) YCMenuViewController *menuViewController;
@end
