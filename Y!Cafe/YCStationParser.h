//
//  YCStationParser.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/31/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCStationParser : NSObject
- (NSDictionary*)parseStationData:(NSDictionary *)jsonData;
@end
