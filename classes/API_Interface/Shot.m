
//
//  Shot.m
//  OnPar
//
//  Created by Kevin R Benton on 11/13/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Shot.h"

@implementation Shot

@synthesize _sid;
@synthesize _holeID;
@synthesize _club;
@synthesize _shotNumber;
@synthesize _aimLatitude;
@synthesize _aimLongitude;
@synthesize _startLatitude;
@synthesize _startLongitude;
@synthesize _endLatitude;
@synthesize _endLongitude;

- (id) construct: (int) data;
{
    NSLog(@"Shot constructor called");
    if (data == 0) {
        return [self init];
    } else {
        return [self initLoad: data];
    }
}

- (int) sid;
{
    return _sid;
}

- (int) holeID;
{
    return _holeID;
}

- (int) club;
{
    return _club;
}

- (int) shotNumber;
{
    return _shotNumber;
}

- (double) aimLatitude;
{
    return _aimLatitude;
}

- (double) aimLongitude;
{
    return _aimLongitude;
}

- (double) startLatitude;
{
    return _startLatitude;
}

- (double) startLongitude;
{
    return _startLongitude;
}

- (double) endLatitude;
{
    return _endLatitude;
}

- (double) endLongitude;
{
    return _endLongitude;
}

- (id) init;
{
    NSLog(@"Shot constructor called. No data be retreived from the API.");
    if (self = [super init]) {
        self._sid = 0;
        self._holeID = 0;
        self._club = 0;
        self._shotNumber = 0;
        self._aimLatitude = 0.0;
        self._aimLongitude = 0.0;
        self._startLatitude = 0.0;
        self._startLongitude = 0.0;
        self._endLatitude = 0.0;
        self._endLongitude = 0.0;
    }
    
    return self;
}

- (id) initLoad: (int) data;
{
    NSLog(@"Shot constructor called with ID. Data being retrieved from the API.");
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", SHOT_GETID_URI, data];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                                    andStatus: 200
                  ];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *shot = [jsonObject valueForKey: @"shot"];
        
        // call the constructor with all the values
        Shot *this = [[Shot alloc] init];
        
        this._sid            = [[shot valueForKey: @"id"] intValue];
        this._holeID         = [[shot valueForKey: @"holeID"] intValue];
        this._club           = [[shot valueForKey: @"club"] intValue];
        this._shotNumber     = [[shot valueForKey: @"shotNumber"] intValue];
        this._aimLatitude    = [[shot valueForKey: @"aimLatitude"] doubleValue];
        this._aimLongitude   = [[shot valueForKey: @"aimLongitude"] doubleValue];
        this._startLatitude  = [[shot valueForKey: @"startLatitude"] doubleValue];
        this._startLongitude = [[shot valueForKey: @"startLongitude"] doubleValue];
        this._endLatitude    = [[shot valueForKey: @"startLatitude"] doubleValue];
        this._endLongitude   = [[shot valueForKey: @"startLongitude"] doubleValue];
        
        return this;
    } else {
        return [self init];
    }
}

- (NSDictionary *) export;
{
    NSLog(@"Exporting shot object");
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt: [self sid]], @"id",
                            [NSNumber numberWithInt: [self holeID]], @"holeID",
                            [NSNumber numberWithInt: [self club]], @"club",
                            [NSNumber numberWithInt: [self shotNumber]], @"shotNumber",
                            [NSNumber numberWithDouble: [self aimLatitude]], @"aimLatitude",
                            [NSNumber numberWithDouble: [self aimLongitude]], @"aimLongitude",
                            [NSNumber numberWithDouble: [self startLatitude]], @"startLatitude",
                            [NSNumber numberWithDouble: [self startLongitude]], @"startLongitude",
                            [NSNumber numberWithDouble: [self endLatitude]], @"endLatitude",
                            [NSNumber numberWithDouble: [self endLongitude]], @"endLongitude",
                            nil
                            ];
    
    NSDictionary *shot = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"shot" , nil];
    
    return shot;
}

@end
