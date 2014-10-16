//
//  YCStationParser.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/31/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCStationParser.h"
#import "YCStationModel.h"
@implementation YCStationParser
- (NSDictionary*)parseStationData:(NSDictionary *)jsonData {
    NSMutableArray *breakfastArray = [NSMutableArray array];
    NSMutableArray *lunchArray = [NSMutableArray array];
    NSMutableArray *dinnerArray = [NSMutableArray array];

    NSMutableDictionary *menuDict = [NSMutableDictionary new];

    NSDictionary *cafeData = jsonData[@"cafe"];
    NSArray *menuData = cafeData[@"menu"];
    NSDictionary *menuDictionary = [menuData firstObject];
    NSArray *dayMenu = menuDictionary[@"days"] ;
    NSDictionary *dayMenuDictionary = [dayMenu firstObject];

    NSDictionary *dayPartsMenu = dayMenuDictionary[@"dayParts"] ;

    
    if (![dayPartsMenu isKindOfClass:[NSDictionary class]]){
        NSDictionary *dict = nil;
        return dict;
        
    }
 
    NSArray *breakfastMenu = dayPartsMenu[@"B"] ;
    NSArray *lunchMenu = dayPartsMenu[@"L"] ;
    NSArray *dinnerMenu = dayPartsMenu[@"D"] ;

//    NSLog(@"breakfastMenu:%@",breakfastMenu);
//    NSLog(@"lunchMenu:%@",lunchMenu);
//    NSLog(@"dinnerMenu:%@",dinnerMenu);

//    
//    NSMutableArray *menuArray = [NSMutableArray new];
//    
//    [menuArray addObjectsFromArray:breakfastMenu];
//    [menuArray addObjectsFromArray:lunchMenu];
//    [menuArray addObjectsFromArray:dinnerMenu];

    for (NSDictionary *dictionary in breakfastMenu) {
        
        YCStationModel *stationModel = [YCStationModel new];
        NSLog(@"dictionary:%@",dictionary);
        stationModel.description_short = dictionary[@"description"];
        stationModel.description_full = dictionary[@"description_full"];
        NSArray *mealTypeArray = dictionary[@"mealTypes"];
        NSDictionary *mealTypeDictionary = [mealTypeArray firstObject];
        stationModel.mealType = mealTypeDictionary[@"meal_type"];
        [breakfastArray addObject:stationModel];
    }
    
    [menuDict setObject:breakfastArray forKey:@"breakfastMenu"];
    
    for (NSDictionary *dictionary in lunchMenu) {
        
        YCStationModel *stationModel = [YCStationModel new];
        NSLog(@"dictionary:%@",dictionary);
        stationModel.description_short = dictionary[@"description"];
        stationModel.description_full = dictionary[@"description_full"];
        NSArray *mealTypeArray = dictionary[@"mealTypes"];
        NSDictionary *mealTypeDictionary = [mealTypeArray firstObject];
        stationModel.mealType = mealTypeDictionary[@"meal_type"];
        [lunchArray addObject:stationModel];
    }
    
    [menuDict setObject:lunchArray forKey:@"lunchMenu"];
 
    for (NSDictionary *dictionary in dinnerMenu) {
        
        YCStationModel *stationModel = [YCStationModel new];
        NSLog(@"dictionary:%@",dictionary);
        stationModel.description_short = dictionary[@"description"];
        stationModel.description_full = dictionary[@"description_full"];
        NSArray *mealTypeArray = dictionary[@"mealTypes"];
        NSDictionary *mealTypeDictionary = [mealTypeArray firstObject];
        stationModel.mealType = mealTypeDictionary[@"meal_type"];
        [dinnerArray addObject:stationModel];
    }
    
    [menuDict setObject:dinnerArray forKey:@"dinnerMenu"];
 
    
    NSLog(@"menuDict:%@",menuDict);
    return menuDict;
}
@end
