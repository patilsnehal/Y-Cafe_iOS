//
//  YCMenuTableViewCell.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/31/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YCStationModel.h"

@interface YCMenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *description_short;
@property (weak, nonatomic) IBOutlet UILabel *description_full;
@property (nonatomic, strong) YCStationModel *stationModel;
-(void)loadDateViewCell;
@end
