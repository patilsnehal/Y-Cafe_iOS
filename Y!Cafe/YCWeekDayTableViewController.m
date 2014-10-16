//
//  WeekDayTableViewController.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/22/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCWeekDayTableViewController.h"
 
@implementation YCWeekDayTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"EEEE, MMMM dd yyyy"];
    NSDate *now = [NSDate date];
    NSString *dateString = [format stringFromDate:now];
    
    self.weekdays = [NSMutableArray arrayWithObjects:dateString, dateString, dateString, dateString, dateString, dateString, dateString, nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;    //count number of row from counting array hear cataGorry is An Array
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.weekdays objectAtIndex:indexPath.row]];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // return empty view, as it will help to not to show empty rows at the bottom of the table, if they are any
    UIView *view = [[UIView alloc] init];
    return view;
}

-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger itemCount = self.weekdays.count - 1;
    float val = ((float)index / (float)itemCount) * 0.6;
    return [UIColor colorWithRed: 123.0 green:val blue: 153.0 alpha:1.0];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
}
@end
