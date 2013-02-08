//
//  Shot.h
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface Shot : NSObject

// private attributes
@property (nonatomic) NSNumber *ID;
@property (nonatomic) NSNumber *holeID;
@property (nonatomic) NSNumber *club;
@property (nonatomic) NSNumber *shotNumber;
@property (nonatomic) NSNumber *aimLatitude;
@property (nonatomic) NSNumber *aimLongitude;
@property (nonatomic) NSNumber *startLatitude;
@property (nonatomic) NSNumber *startLongitude;
@property (nonatomic) NSNumber *endLatitude;
@property (nonatomic) NSNumber *endLongitude;

// public methods
- (id) construct: (NSObject *) data;

// private methods
- (id) init;
- (id) init: (NSDictionary *) data;
- (void) fillVariables: (NSDictionary *) data;
- (NSDictionary *) export;

@end
