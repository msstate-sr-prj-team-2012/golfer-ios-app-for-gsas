//
//  dataManager.h
//  OnPar
//
//  Created by Chad Galloway on 11/9/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "onPar_SDK.h"
#import "MBProgressHUD.h"

@interface dataManager : NSObject{
    
    NSMutableArray *golfers;
    NSMutableDictionary *roundInfo;
}



@property (nonatomic, retain) NSMutableArray *golfers;
@property (nonatomic, retain) NSMutableDictionary *roundInfo;

@property (nonatomic, retain) NSMutableDictionary *_rounds;
@property (nonatomic, retain) NSMutableArray *_users;
@property (nonatomic, retain) Course *_course;


- (NSMutableDictionary *) rounds;
- (NSMutableArray *) users;
- (Course *) course;

- (id) init;
- (void) addRound: (Round *) round forUserWithID: (int) userID;
- (Round *) roundForUserWithID: (int) userID;
- (void) addUser: (User *) user;
- (BOOL) uploadRounds;
- (void) startRoundForUser: (User *) user teeID: (int) teeID;

- (Hole *) getHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;
- (Hole *) addShot: (Shot *) shot toHoleWithHoleNumber: (int) holeNumber forUserWithID: (int) userID;

+ (id) myDataManager;

@end
