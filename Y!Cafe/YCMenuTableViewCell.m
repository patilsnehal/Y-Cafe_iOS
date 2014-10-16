//
//  YCMenuTableViewCell.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/31/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCMenuTableViewCell.h"

@implementation YCMenuTableViewCell

-(void)loadDateViewCell{
    self.description_short.text = self.stationModel.description_short;
    self.description_full.text = self.stationModel.description_full;
    self.description_short.textColor = [UIColor darkGrayColor];
    self.description_full.textColor = [UIColor darkGrayColor];
}
@end
