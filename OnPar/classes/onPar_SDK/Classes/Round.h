//
//  Round.h
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
#import "Hole.h"
#import "User.h"
#import "Course.h"

@interface Round : NSObject

// private attributes
@property (nonatomic)         NSNumber       *ID;
@property (nonatomic, retain) User           *user;
@property (nonatomic, retain) Course         *course;
@property (nonatomic)         NSNumber       *totalScore;
@property (nonatomic)         NSNumber       *teeID;
@property (nonatomic, copy)   NSString       *startTime;
@property (nonatomic, retain) NSMutableArray *holes;

// public methods
- (id) construct: (NSObject *) data;
- (BOOL) save;
- (BOOL) del;
+ (Round *) startNowWithUser: (User *) u onCourse: (Course *) c fromTee: (NSNumber *) t;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (NSDictionary *) export;
- (void) fillVariables: (NSDictionary *) data;

@end
