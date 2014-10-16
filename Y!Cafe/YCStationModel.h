//
//  StationModel.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/23/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Station
 =======
 "station_id":"4857",
 "station":"market grill",
 "days_of_week":"2",
 "meal_type_id":"3",
 "description":"lemongrass-chile chicken sate",
 "description_full":"with Thai peanut sauce and pickled cucumber salad",
 "nutrition_info":"",
 */
@interface YCStationModel : NSObject
@property (nonatomic,strong) NSString *description_short;
@property (nonatomic,strong) NSString *description_full;
@property (nonatomic,strong) NSString *mealType;
@end
