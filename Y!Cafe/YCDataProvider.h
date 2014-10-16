//
//  DataProvider.h
//  Y!Cafe
//
//  Created by Snehal Patil on 7/23/14.
//  Copyright (c) 2014 Snehal Patil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YCStationModel.h"

@interface YCDataProvider : NSObject
/**
 On success, this block returns 'SQProduct' object
 */
typedef void (^blockStationDataSuccess) (NSDictionary *menuDictInfo);

/**
 
 This block is executed on the completion of an unsuccessful request. User info dictionary contains (or can contain) several predefined string and object values related to an error.
 Error dictionary keys and values:
 
 "NSLocalizedDescription": The corresponding value is a localized string representation of the error that, if present, will be returned by localizedDescription.
 
 "NSUnderlyingError": The corresponding value is an error that was encountered in an underlying implementation and caused the error that the receiver represents to occur.
 */
typedef void (^blockDataError) (NSDictionary *error);

- (void)getStationInfo:(NSDictionary*)params
             onSuccess:(blockStationDataSuccess)onSuccess
               onError:(blockDataError)onError;
@end
