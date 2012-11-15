//
//  Hole.h
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
#import "Shot.h"

@interface Hole : NSObject

@property (nonatomic) int _hid;
@property (nonatomic) int _roundID;
@property (nonatomic) int _distance;
@property (nonatomic) int _holeScore;
@property (nonatomic) int _holeNumber;
@property (nonatomic) BOOL _FIR;
@property (nonatomic) BOOL _GIR;
@property (nonatomic) int _putts;
@property (nonatomic) double _firstRefLat;
@property (nonatomic) double _firstRefLong;
@property (nonatomic) double _secondRefLat;
@property (nonatomic) double _secondRefLong;
@property (nonatomic) double _thirdRefLat;
@property (nonatomic) double _thirdRefLong;
@property (nonatomic) int _firstRefX;
@property (nonatomic) int _firstRefY;
@property (nonatomic) int _secondRefX;
@property (nonatomic) int _secondRefY;
@property (nonatomic) int _thirdRefX;
@property (nonatomic) int _thirdRefY;
@property (nonatomic, retain) NSMutableArray *_shots;

- (int) hid;
- (int) roundID;
- (int) distance;
- (int) holeScore;
- (int) holeNumber;
- (BOOL) FIR;
- (BOOL) GIR;
- (int) putts;
- (double) firstRefLat;
- (double) firstRefLong;
- (double) secondRefLat;
- (double) secondRefLong;
- (double) thirdRefLat;
- (double) thirdRefLong;
- (int) firstRefX;
- (int) firstRefY;
- (int) secondRefX;
- (int) secondRefY;
- (int) thirdRefX;
- (int) thirdRefY;
- (NSMutableArray *) shots;

- (id) construct: (int) data;

- (id) init;

- (id) initLoad: (int) data;

- (NSDictionary *) export;

@end
