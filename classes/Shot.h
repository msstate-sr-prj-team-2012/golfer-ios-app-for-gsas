//
//  Shot.h
//  OnPar
//
//  Created by Kevin R Benton on 11/13/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface Shot : NSObject

@property (nonatomic) int _sid;
@property (nonatomic) int _holeID;
@property (nonatomic) int _club;
@property (nonatomic) int _shotNumber;
@property (nonatomic) double _aimLatitude;
@property (nonatomic) double _aimLongitude;
@property (nonatomic) double _startLatitude;
@property (nonatomic) double _startLongitude;
@property (nonatomic) double _endLatitude;
@property (nonatomic) double _endLongitude;

- (int) sid;
- (int) holeID;
- (int) club;
- (int) shotNumber;
- (double) aimLatitude;
- (double) aimLongitude;
- (double) startLatitude;
- (double) startLongitude;
- (double) endLatitude;
- (double) endLongitude;

- (id) construct: (int) data;

- (id) init;

- (id) initLoad: (int) data;

- (NSDictionary *) export;

@end
