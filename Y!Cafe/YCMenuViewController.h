//
//  MenuViewController.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/23/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *menuTableview;
@property (nonatomic, weak) IBOutlet UIButton *leftArrowButton;
@property (nonatomic, weak) IBOutlet UIButton *rightArrowButton;
@property (nonatomic, weak) IBOutlet UILabel *dateLabel;

@property (nonatomic, strong) NSString *cafeID;
@end
