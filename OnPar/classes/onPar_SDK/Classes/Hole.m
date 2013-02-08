//
//  Hole.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Hole.h"

@implementation Hole

@synthesize ID;
@synthesize roundID;
@synthesize distance;
@synthesize holeScore;
@synthesize holeNumber;
@synthesize FIR;
@synthesize GIR;
@synthesize putts;
@synthesize firstRefLat;
@synthesize firstRefLong;
@synthesize secondRefLat;
@synthesize secondRefLong;
@synthesize thirdRefLat;
@synthesize thirdRefLong;
@synthesize firstRefX;
@synthesize firstRefY;
@synthesize secondRefX;
@synthesize secondRefY;
@synthesize thirdRefX;
@synthesize thirdRefY;
@synthesize shots;

- (id) construct: (NSObject *) data;
{
    if (data != nil) {
        if ([data isKindOfClass: [NSDictionary class]]) {
            return [self init: (NSDictionary *) data];
        } else {
            // unsupported type
            return nil;
        }
    } else {
        return [self init];
    }
}

- (id) init;
{
    if (self = [super init]) {
        self.ID =           nil;
        self.roundID =       nil;
        self.distance =      nil;
        self.holeScore =     nil;
        self.holeNumber =    nil;
        self.FIR =           nil;
        self.GIR =           nil;
        self.putts =         nil;
        self.firstRefLat =   nil;
        self.firstRefLong =  nil;
        self.secondRefLat =  nil;
        self.secondRefLong = nil;
        self.thirdRefLat =   nil;
        self.thirdRefLong =  nil;
        self.firstRefX =     nil;
        self.firstRefY =     nil;
        self.secondRefX =    nil;
        self.secondRefY =    nil;
        self.thirdRefX =     nil;
        self.thirdRefY =     nil;
        self.shots =         nil;
    }
    
    return self;
}

- (id) init: (NSDictionary *) data;
{
    if (self = [super init]) {
        if (data == nil) {
            self = [self init];
        } else {
            [self fillVariables: data];
        }
        
        return self;
    } else {
        return nil;
    }
}

- (void) fillVariables: (NSDictionary *) data;
{
    
    NSArray *hole = [data valueForKey: @"hole"];
    
    NSMutableArray *shotArray = [[NSMutableArray alloc] init];
    for (NSDictionary *shot in [hole valueForKey: @"shots"]) {
        [shotArray addObject: [[Shot alloc] construct: shot]];
    }
    
    self.ID =            [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"id"]            intValue]];
    self.roundID =       [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"roundID"]       intValue]];
    self.distance =      [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"distance"]      intValue]];
    self.holeScore =     [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"holeScore"]     intValue]];
    self.holeNumber =    [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"holeNumber"]    intValue]];
    self.FIR =           [[NSNumber alloc] initWithBool:   [[hole valueForKey: @"FIR"]           boolValue]];
    self.GIR =           [[NSNumber alloc] initWithBool:   [[hole valueForKey: @"GIR"]           boolValue]];
    self.putts =         [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"putts"]         intValue]];
    self.firstRefLat =   [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"firstRefLat"]   doubleValue]];
    self.firstRefLong =  [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"firstRefLong"]  doubleValue]];
    self.secondRefLat =  [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"secondRefLat"]  doubleValue]];
    self.secondRefLong = [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"secondRefLong"] doubleValue]];
    self.thirdRefLat =   [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"thirdRefLat"]   doubleValue]];
    self.thirdRefLong =  [[NSNumber alloc] initWithDouble: [[hole valueForKey: @"thirdRefLong"]  doubleValue]];
    self.firstRefX =     [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"firstRefX"]     intValue]];
    self.firstRefY =     [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"firstRefY"]     intValue]];
    self.secondRefX =    [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"secondRefX"]    intValue]];
    self.secondRefY =    [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"secondRefY"]    intValue]];
    self.thirdRefX =     [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"thirdRefX"]     intValue]];
    self.thirdRefY =     [[NSNumber alloc] initWithInt:    [[hole valueForKey: @"thirdRefY"]     intValue]];
    self.shots =         shotArray;
}

- (NSDictionary *) export;
{
    NSMutableArray *shotArray = [[NSMutableArray alloc] init];
    for (Shot *s in self.shots) {
        [shotArray addObject: [s export]];
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject: self.ID ? self.ID : [NSNull null] forKey: @"id"];
    [params setObject: self.roundID ? self.roundID : [NSNull null] forKey: @"roundID"];
    [params setObject: self.distance ? self.distance : [NSNull null] forKey: @"distance"];
    [params setObject: self.holeScore ? self.holeScore : [NSNull null] forKey: @"holeScore"];
    [params setObject: self.holeNumber ? self.holeNumber : [NSNull null] forKey: @"holeNumber"];
    [params setObject: self.FIR ? self.FIR : [NSNull null] forKey: @"FIR"];
    [params setObject: self.GIR ? self.GIR : [NSNull null] forKey: @"GIR"];
    [params setObject: self.putts ? self.putts : [NSNull null] forKey: @"putts"];
    [params setObject: self.firstRefLat ? self.firstRefLat : [NSNull null] forKey: @"firstRefLat"];
    [params setObject: self.firstRefLong ? self.firstRefLong : [NSNull null] forKey: @"firstRefLong"];
    [params setObject: self.secondRefLat ? self.secondRefLat : [NSNull null] forKey: @"secondRefLat"];
    [params setObject: self.secondRefLong ? self.secondRefLong : [NSNull null] forKey: @"secondRefLong"];
    [params setObject: self.thirdRefLat ? self.thirdRefLat : [NSNull null] forKey: @"thirdRefLat"];
    [params setObject: self.thirdRefLong ? self.thirdRefLong : [NSNull null] forKey: @"thirdRefLong"];
    [params setObject: self.firstRefX ? self.firstRefX : [NSNull null] forKey: @"firstRefX"];
    [params setObject: self.firstRefY ? self.firstRefY : [NSNull null] forKey: @"firstRefY"];
    [params setObject: self.secondRefX ? self.secondRefX : [NSNull null] forKey: @"secondRefX"];
    [params setObject: self.secondRefY ? self.secondRefY : [NSNull null] forKey: @"secondRefY"];
    [params setObject: self.thirdRefX ? self.thirdRefX : [NSNull null] forKey: @"thirdRefX"];
    [params setObject: self.thirdRefY ? self.thirdRefY : [NSNull null] forKey: @"thirdRefY"];
    [params setObject: shotArray forKey: @"shots"];
    
    NSDictionary *hole = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"hole" , nil];
    
    return hole;
}

@end
