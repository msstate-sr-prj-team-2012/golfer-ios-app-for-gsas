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

@property (nonatomic) int _rid;
@property (nonatomic, retain) User *_user;
@property (nonatomic, retain) Course *_course;
@property (nonatomic) int _totalScore;
@property (nonatomic) int _teeID;
@property (nonatomic, copy) NSString *_startTime;
@property (nonatomic, retain) NSMutableArray *_holes;

- (int) rid;
- (User *) user;
- (Course *) course;
- (int) totalScore;
- (int) teeID;
- (NSString *) startTime;
- (NSMutableArray *) holes;

- (id) construct: (int) data;

- (id) init;

- (id) initLoad: (int) data;
- (BOOL) save;
- (BOOL) del;
- (NSDictionary *) export;

+ (Round *) startNewWithUser: (User *) user Course: (Course *) course teeID: (int) teeID;

@end
