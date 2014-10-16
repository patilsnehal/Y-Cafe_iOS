//
//  YCConnection.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/30/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void (^blockDataError) (NSDictionary *error);
typedef void (^blockDataRequestSuccess) (id response);

@interface YCConnection : NSObject
- (void)getDataFromBaseURL:(NSString *)baseURL
                 dataParam:(NSDictionary *)parameters
                 onSuccess:(blockDataRequestSuccess)onSuccess
                   onError:(blockDataError)onError;
- (void)postDataFromBaseURL:(NSString *)baseURL
                  dataParam:(NSDictionary *)parameters
                  onSuccess:(blockDataRequestSuccess)onSuccess
                    onError:(blockDataError)onError;
@end
