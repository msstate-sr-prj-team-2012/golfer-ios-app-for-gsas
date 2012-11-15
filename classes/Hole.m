//
//  Hole.m
//  OnPar
//
//  Created by Kevin R Benton on 11/13/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Hole.h"

@implementation Hole

@synthesize _hid;
@synthesize _roundID;
@synthesize _distance;
@synthesize _holeScore;
@synthesize _holeNumber;
@synthesize _FIR;
@synthesize _GIR;
@synthesize _putts;
@synthesize _firstRefLat;
@synthesize _firstRefLong;
@synthesize _secondRefLat;
@synthesize _secondRefLong;
@synthesize _thirdRefLat;
@synthesize _thirdRefLong;
@synthesize _firstRefX;
@synthesize _firstRefY;
@synthesize _secondRefX;
@synthesize _secondRefY;
@synthesize _thirdRefX;
@synthesize _thirdRefY;
@synthesize _shots;

- (int) hid;
{
    return _hid;
}

- (int) roundID;
{
    return _roundID;
}

- (int) distance;
{
    return _distance;
}

- (int) holeScore;
{
    return _holeScore;
}

- (int) holeNumber;
{
    return _holeNumber;
}

- (BOOL) FIR;
{
    return _FIR;
}

- (BOOL) GIR;
{
    return _GIR;
}

- (int) putts;
{
    return _putts;
}

- (double) firstRefLat;
{
    return _firstRefLat;
}

- (double) firstRefLong;
{
    return _firstRefLong;
}

- (double) secondRefLat;
{
    return _secondRefLat;
}

- (double) secondRefLong;
{
    return _secondRefLong;
}

- (double) thirdRefLat;
{
    return _thirdRefLat;
}

- (double) thirdRefLong;
{
    return _thirdRefLong;
}

- (int) firstRefX;
{
    return _firstRefX;
}

- (int) firstRefY;
{
    return _firstRefY;
}

- (int) secondRefX;
{
    return _secondRefX;
}

- (int) secondRefY;
{
    return _secondRefY;
}

- (int) thirdRefX;
{
    return _thirdRefX;
}

- (int) thirdRefY;
{
    return _thirdRefY;
}

- (NSMutableArray *) shots;
{
    return _shots;
}

- (id) construct: (int) data;
{
    NSLog(@"Hole constructor called");
    if (data == 0) {
        return [self init];
    } else {
        return [self initLoad: data];
    }
}

- (id) init;
{
    if (self = [super init]) {
        self._hid = 0;
        self._roundID = 0;
        self._distance = 0;
        self._holeScore = 0;
        self._holeNumber = 0;
        self._FIR = FALSE;
        self._GIR = FALSE;
        self._putts = 0;
        self._firstRefLat = 0.0;
        self._firstRefLong = 0.0;
        self._secondRefLat = 0.0;
        self._secondRefLong = 0.0;
        self._thirdRefLat = 0.0;
        self._thirdRefLong = 0.0;
        self._firstRefX = 0;
        self._firstRefY = 0;
        self._secondRefX = 0;
        self._secondRefY = 0;
        self._thirdRefX = 0;
        self._thirdRefY = 0;
        self._shots = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id) initLoad: (int) data;
{
    NSLog(@"Hole constructor called with ID. Data being retrieved from the API.");
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", HOLE_GETID_URI, data];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                                    andStatus: 200
                  ];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *hole = [jsonObject valueForKey: @"hole"];
        
        // call the constructor with all the values
        Hole *this = [self init];
        
        this._hid           = [[hole valueForKey: @"id"] intValue];
        this._roundID       = [[hole valueForKey: @"roundID"] intValue];
        this._distance      = [[hole valueForKey: @"distance"] intValue];
        this._holeScore     = [[hole valueForKey: @"holeScore"] intValue];
        this._holeNumber    = [[hole valueForKey: @"holeNumber"] intValue];
        this._FIR           = [[hole valueForKey: @"FIR"] boolValue];
        this._GIR           = [[hole valueForKey: @"GIR"] boolValue];
        this._putts         = [[hole valueForKey: @"putts"] intValue];
        this._firstRefLat   = [[hole valueForKey: @"firstRefLat"] doubleValue];
        this._firstRefLong  = [[hole valueForKey: @"firstRefLong"] doubleValue];
        this._secondRefLat  = [[hole valueForKey: @"secondRefLat"] doubleValue];
        this._secondRefLong = [[hole valueForKey: @"secondRefLong"] doubleValue];
        this._thirdRefLat   = [[hole valueForKey: @"thirdRefLat"] doubleValue];
        this._thirdRefLong  = [[hole valueForKey: @"thirdRefLong"] doubleValue];
        this._firstRefX     = [[hole valueForKey: @"firstRefX"] intValue];
        this._firstRefY     = [[hole valueForKey: @"firstRefY"] intValue];
        this._secondRefX    = [[hole valueForKey: @"secondRefX"] intValue];
        this._secondRefY    = [[hole valueForKey: @"secondRefY"] intValue];
        this._thirdRefX     = [[hole valueForKey: @"thirdRefX"] intValue];
        this._thirdRefY     = [[hole valueForKey: @"thirdRefY"] intValue];
        
        for (NSArray *dict in [hole valueForKey: @"shots"]) {
            NSArray *shot = [dict valueForKey: @"shot"];
            Shot *s = [[Shot alloc] init];
            
            s._sid            = [[shot valueForKey: @"id"] intValue];
            s._holeID         = [[shot valueForKey: @"holeID"] intValue];
            s._club           = [[shot valueForKey: @"club"] intValue];
            s._shotNumber     = [[shot valueForKey: @"shotNumber"] intValue];
            s._aimLatitude    = [[shot valueForKey: @"aimLatitude"] doubleValue];
            s._aimLongitude   = [[shot valueForKey: @"aimLongitude"] doubleValue];
            s._startLatitude  = [[shot valueForKey: @"startLatitude"] doubleValue];
            s._startLongitude = [[shot valueForKey: @"startLongitude"] doubleValue];
            s._endLatitude    = [[shot valueForKey: @"startLatitude"] doubleValue];
            s._endLongitude   = [[shot valueForKey: @"startLongitude"] doubleValue];

            [this._shots addObject: s];
        }
        
        return this;
        
    } else {
        return [self init];
    }
}

- (NSDictionary *) export;
{
    NSLog(@"Exporting hole object");
    
    NSMutableArray *shots = [[NSMutableArray alloc] init];
    for (Shot *s in [self shots]) {
        [shots addObject: [s export]];
    }
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt: [self hid]], @"id",
                            [NSNumber numberWithInt: [self roundID]], @"roundID",
                            [NSNumber numberWithInt: [self distance]], @"distance",
                            [NSNumber numberWithInt: [self holeScore]], @"holeScore",
                            [NSNumber numberWithInt: [self holeNumber]], @"holeNumber",
                            [NSNumber numberWithBool: [self FIR]], @"FIR",
                            [NSNumber numberWithBool: [self GIR]], @"GIR",
                            [NSNumber numberWithInt: [self putts]], @"putts",
                            [NSNumber numberWithDouble: [self firstRefLat]], @"firstRefLat",
                            [NSNumber numberWithDouble: [self firstRefLong]], @"firstRefLong",
                            [NSNumber numberWithDouble: [self secondRefLat]], @"secondRefLat",
                            [NSNumber numberWithDouble: [self secondRefLong]], @"secondRefLong",
                            [NSNumber numberWithDouble: [self thirdRefLat]], @"thirdRefLat",
                            [NSNumber numberWithDouble: [self thirdRefLong]], @"thirdRefLong",
                            [NSNumber numberWithInt: [self firstRefX]], @"firstRefX",
                            [NSNumber numberWithInt: [self firstRefY]], @"firstRefY",
                            [NSNumber numberWithInt: [self secondRefX]], @"secondRefX",
                            [NSNumber numberWithInt: [self secondRefY]], @"secondRefY",
                            [NSNumber numberWithInt: [self thirdRefX]], @"thirdRefX",
                            [NSNumber numberWithInt: [self thirdRefY]], @"thirdRefY",
                            shots, @"shots",
                            nil
                            ];
    
    NSDictionary *hole = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"hole" , nil];
    
    return hole;
}

@end
