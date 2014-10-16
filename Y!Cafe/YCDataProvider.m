//
//  DataProvider.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/23/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCDataProvider.h"
#import "YCStationParser.h"
#import "YCConnection.h"
#import "YCConstant.h"

@implementation YCDataProvider
- (void)getStationInfo:(NSDictionary*)params
             onSuccess:(blockStationDataSuccess)onSuccess
               onError:(blockDataError)onError {
    


    NSString *cafeID = [params objectForKey:kCafeID];
    NSString *dateString = [params objectForKey:kDate];

    NSString *url = [NSString stringWithFormat:@"http://legacy.cafebonappetit.com/api/1/cafe/%@/date/%@/format/json",cafeID,dateString];

    YCConnection *conn = [YCConnection new];
    [conn getDataFromBaseURL:url
                   dataParam:nil
                   onSuccess:^(id response) {
                       
                       YCStationParser *stationParser = [YCStationParser new];
                       NSDictionary *menuDict = [stationParser parseStationData:response];

                       // Return product info
                       onSuccess(menuDict);
                       
                   } onError:^(NSDictionary *error) {
                       
                       NSLog(@"Error fetching product: %@", error);
                       // Error fetching playlist
                       onError(error);
                   }];
}
@end
