//
//  dataManager.m
//  OnPar
//
//  Created by Chad Galloway on 11/9/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "dataManager.h"

@implementation dataManager

@synthesize golfers;
@synthesize roundInfo;

@synthesize _rounds;
@synthesize _users;
@synthesize _course;

#pragma mark Singleton Methods

- (NSMutableDictionary *) rounds;
{
    return _rounds;
}

- (NSMutableArray *) users;
{
    return _users;
}

- (Course *) course;
{
    return _course;
}

- (id) init;
{
    if (self = [super init]) {
        // initialize data here
        self.golfers = [[NSMutableArray alloc] init];
        self.roundInfo = [[NSMutableDictionary alloc] init];
        self._rounds = [[NSMutableDictionary alloc] init];
        self._users = [[NSMutableArray alloc] init];
        self._course = [[Course alloc] init];
    }
    return self;
}

- (void) addRound: (Round *) round forUserWithID: (int) userID;
{
    [[self rounds] setValue: round forKey: [NSString stringWithFormat: @"%d", userID]];
}

- (Round *) roundForUserWithID: (int) userID;
{
    return [[self rounds] valueForKey: [NSString stringWithFormat:@"%d", userID]];
}

- (void) addUser: (User *) user;
{
    [[self users] addObject: user];
}

- (BOOL) uploadRounds;
{
    BOOL check = TRUE;
    BOOL retVal = TRUE;
    
    for (NSString *key in [self rounds]) {
        Round *r = [[self rounds] objectForKey: key];
        
        Round *r2 = [[Round alloc] init];
        r2._course = [self course];
        r2._user = [[self users] objectAtIndex: 0];
        r2._teeID = 3;
        r2._totalScore = 4;
        
        Hole *h = [[Hole alloc] init];
        
        h = [[r holes] objectAtIndex: 0];
        h._holeScore = 4;
        h._FIR = TRUE;
        h._GIR = TRUE;
        h._putts = 2;
        
        [r2._holes addObject: h];
        
        NSLog(@"Round: %@", [r export]);
        
        retVal = [r2 save];
        check = check && retVal;
    }
    
    return check;
}

- (void) startRoundForUser: (User *) user teeID: (int) teeID;
{
    Round *r = [Round startNewWithUser: user Course: [self course] teeID: teeID];
    [self addRound: r forUserWithID: [user uid]];
}

- (Hole *) getHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;
{
    Round *r = [self roundForUserWithID: userID];
    
    for (Hole *h in [r holes]) {
        if ([h holeNumber] == holeNumber) {
            return h;
        }
    }
    
    return [[Hole alloc] init];
}

- (Hole *) addShot: (Shot *) shot toHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;
{
    NSLog(@"Adding shot: %@ to hole with holeNumber: %d for user with ID: %d", [shot export], holeNumber, userID);
    Round *r = [self roundForUserWithID: userID];
    
    for (Hole *h in [r holes]) {
        NSLog(@"Hole number: %d", [h holeNumber]);
        if ([h holeNumber] == holeNumber) {
            [[h shots] addObject: shot];
            return h;
        }
    }
    
    return [[Hole alloc] init];

}

+ (id) myDataManager;
{
    static dataManager *myDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myDataManager = [[self alloc] init];
    });
    return myDataManager;
}

@end