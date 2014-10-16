//
//  YCConnection.m
//  Y!Cafe
//
//  Created by Snehal Patil on 7/30/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import "YCConnection.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"

@implementation YCConnection

- (void)getDataFromBaseURL:(NSString *)baseURL
                 dataParam:(NSDictionary *)parameters
                 onSuccess:(blockDataRequestSuccess)onSuccess
                   onError:(blockDataError)onError {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:baseURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_queue_t CQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(CQ, ^(void) {
            // Callback when success and pass the response string
            onSuccess(responseObject);
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        onError(error.userInfo);
    }];
}


- (void)postDataFromBaseURL:(NSString *)baseURL
                  dataParam:(NSDictionary *)parameters
                  onSuccess:(blockDataRequestSuccess)onSuccess
                    onError:(blockDataError)onError {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:baseURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        onSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        onError(error.userInfo);
    }];
}

@end