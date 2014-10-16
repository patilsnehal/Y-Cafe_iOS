//
//  cafeTableViewController.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/22/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCcafeTableViewController.h"
#import "YCMenuViewController.h"

@implementation YCcafeTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
   
    self.cafeteria = [NSMutableArray arrayWithObjects:@"URLs", @"Building E", @"Building F", @"BUILDING F JUICE BAR", @"Building G",nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.cafeteria count];
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
    
    cell.textLabel.text = [self.cafeteria objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // return empty view, as it will help to not to show empty rows at the bottom of the table, if they are any
    UIView *view = [[UIView alloc] init];
    return view;
}

//-(UIColor*)colorForIndex:(NSInteger) index {
//    NSUInteger itemCount = self.cafeteria.count - 1;
//    float val = ((float)index / (float)itemCount) * 0.9;
////    return [UIColor colorWithRed: 123.0 green:val blue: 153.0 alpha:1.0];
//    return [UIColor colorWithRed:96.0/255.0 green:val blue:137.0/255.0 alpha:1];
//}
//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    cell.backgroundColor = [self colorForIndex:indexPath.row];
//}

/*
 682 - Building E
 683 - Building F
 684 - URL
 800 - Building F Juice Bar
 674 - Building G
 361 - Surf’s cafe
 360 - Smiley’ cafe
 363 - Yodel's Cafe
 358 - Boardwalk Cafe
 801 - Verve Coffee Bars, Sunnyvale
 717 - Verve Coffee Bar | Burbank
 808 - Verve Coffee Bar | Burbank
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"MenuSegueway"])
    {
        // Get reference to the destination view controller
        YCMenuViewController *menuVC = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        switch (indexPath.row) {
            case 0:
                menuVC.cafeID = @"684";
                break;
            case 1:
                menuVC.cafeID = @"682";
                break;
            case 2:
                menuVC.cafeID = @"683";
                break;
            case 3:
                menuVC.cafeID = @"800";
                break;
            case 4:
                menuVC.cafeID = @"674";
                break;
            default:
                break;
        }
    }
}
@end
