//
//  API_Interface.h
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "Course.h"
#import "User.h"
#import "Request.h"
#import "Shot.h"
#import "Hole.h"
#import "Round.h"

@interface API_Interface : NSObject

@property (nonatomic, retain) NSMutableDictionary *_rounds;
@property (nonatomic, retain) NSMutableArray *_courses;
@property (nonatomic, retain) NSMutableArray *_users;
@property (nonatomic, retain) Course *_course;

- (NSMutableDictionary *) rounds;
- (NSMutableArray *) users;
- (NSMutableArray *) courses;
- (Course *) course;

- (id) init;
- (void) addRound: (Round *) round forUserWithID: (int) userID;
- (Round *) roundForUserWithID: (int) userID;
- (void) addUser: (User *) user;
- (BOOL) uploadRounds;
- (void) startRoundForUser: (User *) user teeID: (int) teeID;

- (Hole *) getHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;
- (Hole *) addShot: (Shot *) shot toHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;

+ (id) dataManager;

@end
