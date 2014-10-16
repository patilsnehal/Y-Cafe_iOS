//
//  MenuViewController.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/23/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCMenuViewController.h"
#import "YCDataProvider.h"
#import "YCMenuTableViewCell.h"
#import "YCConstant.h"

@interface YCMenuViewController()
@property (nonatomic, strong) NSMutableArray *breakfastArray;
@property (nonatomic, strong) NSMutableArray *luncArray;
@property (nonatomic, strong) NSMutableArray *dinnerArray;
@property (nonatomic, strong) NSMutableDictionary *menuDict;
@property (nonatomic, strong) NSDate *currentDate;
@property (nonatomic, strong) NSString *currentDateString;

@end

@implementation YCMenuViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"cafe view loaded");
    self.breakfastArray  = [NSMutableArray new];
    self.luncArray  = [NSMutableArray new];
    self.dinnerArray  = [NSMutableArray new];
    self.menuDict  = [NSMutableDictionary new];
    [self generateCurrentDate];
    self.dateLabel.text = [self convertDateToStringWithDay:self.currentDate];

    [self getStationData];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.menuDict count];    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    
    switch (section) {
        case 0:
            count = [self.breakfastArray count];
            break;
        case 1:
            count = [self.luncArray count];
            break;
        case 2:
            count = [self.dinnerArray count];
            break;
        default:
            break;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCMenuTableViewCell *cell = (YCMenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"YCMenuTableViewCell"];
    if (cell == nil){
        cell = [[YCMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YCMenuTableViewCell"];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.stationModel = [self.breakfastArray objectAtIndex:indexPath.row];
            break;
        case 1:
            cell.stationModel = [self.luncArray objectAtIndex:indexPath.row];
            break;
        case 2:
            cell.stationModel = [self.dinnerArray objectAtIndex:indexPath.row];
            break;
        default:
            break;
    }
    [cell loadDateViewCell];
    cell.backgroundColor = [UIColor colorWithRed:207.0/255.0 green:189.0/255.0 blue:217.0/255.0 alpha:1];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"Breakfast", @"Breakfast");
            break;
        case 1:
            sectionName = NSLocalizedString(@"Lunch", @"Lunch");
            break;
        case 2:
            sectionName = NSLocalizedString(@"Dinner", @"Dinner");
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
  
    // Text Color
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    // Background color
    header.backgroundColor = [UIColor redColor];// [UIColor colorWithRed:77.0/255.0 green:162.0/255.0 blue:217.0/255.0 alpha:0.1];
    header.textLabel.textColor = [UIColor blackColor];

    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // return empty view, as it will help to not to show empty rows at the bottom of the table, if they are any
    UIView *view = [[UIView alloc] init];
    return view;
}

-(void)getStationData {
    
    // get Product Info on background thread
    dispatch_queue_t CQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(CQ, ^{
        [self getStationDataAsync];
        
    });
}

-(void)getStationDataAsync {
    
    if (!self.cafeID || !self.currentDate) {
        return;
    }
    
    NSDictionary *param = @{kCafeID: self.cafeID,
                            kDate:self.currentDateString};
    
    YCDataProvider *dataProvider = [YCDataProvider new];
    [dataProvider getStationInfo:param
                       onSuccess:^(NSDictionary *menuDictInfo) {
                           
                           dispatch_async(dispatch_get_main_queue(), ^{
                               self.menuDict = [NSMutableDictionary dictionaryWithDictionary:menuDictInfo];
                               self.breakfastArray  = [self.menuDict objectForKey:@"breakfastMenu"];
                               self.luncArray  = [self.menuDict objectForKey:@"lunchMenu"];
                               self.dinnerArray  = [self.menuDict objectForKey:@"dinnerMenu"];
                               
                               NSLog(@"breakfastArray:%@",self.breakfastArray);
                               NSLog(@"luncArray:%@",self.luncArray);
                               NSLog(@"dinnerArray:%@",self.dinnerArray);
                               
                               [self.menuTableview reloadData];
                           });
                           
                       } onError:^(NSDictionary *error) {
                           NSLog(@"error:%@",error);
                       }];
}

-(void)generateCurrentDate{
    // Get Todays date
    self.currentDate  = [NSDate date];
    self.currentDateString = [self convertDateToString:self.currentDate];
}

-(void)getPreviousDateString
{
    int daysToAdd = -1;
    
    // set up date components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:daysToAdd];
    
    // create a calendar
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *yesterday = [gregorian dateByAddingComponents:components toDate:self.currentDate  options:0];
    self.currentDate = yesterday;
}

-(void)getNextDateString
{
    int daysToAdd = 1;
    
    // set up date components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:daysToAdd];
    
    // create a calendar
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *tomorrow = [gregorian dateByAddingComponents:components toDate:self.currentDate   options:0];
    self.currentDate = tomorrow;
}

-(NSString*)convertDateToStringWithDay:(NSDate*)date{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
    NSString *dateString = [dateFormat stringFromDate:date];
    return dateString;
}

-(NSString*)convertDateToString:(NSDate*)date{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormat stringFromDate:self.currentDate ];
    NSLog(@"date: %@", dateString);
    return dateString;
}

- (IBAction)rightArrowButtonClicked:(id)sender {
    [self getNextDateString];
    NSLog(@"%@",[self convertDateToStringWithDay:self.currentDate]);
    self.dateLabel.text = [self convertDateToStringWithDay:self.currentDate];
    self.currentDateString = [self convertDateToString:self.currentDate];

    [self getStationData];
}

- (IBAction)leftArrowButtonClicked:(id)sender {
    [self getPreviousDateString];

    NSLog(@"%@",[self convertDateToStringWithDay:self.currentDate]);
    self.dateLabel.text = [self convertDateToStringWithDay:self.currentDate];
    
    self.currentDateString = [self convertDateToString:self.currentDate];
    [self getStationData];

}



@end
