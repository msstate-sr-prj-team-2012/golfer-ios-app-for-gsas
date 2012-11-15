//
//  defines.h
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface defines : NSObject

// API HTTP Basic Authentication parameters
FOUNDATION_EXPORT NSString *const API_USERNAME;
FOUNDATION_EXPORT NSString *const API_PASSWORD;

// Club constants
FOUNDATION_EXPORT NSInteger *const DRIVER;
FOUNDATION_EXPORT NSInteger *const THREE_WOOD;
FOUNDATION_EXPORT NSInteger *const FOUR_WOOD;
FOUNDATION_EXPORT NSInteger *const FIVE_WOOD;
FOUNDATION_EXPORT NSInteger *const SEVEN_WOOD;
FOUNDATION_EXPORT NSInteger *const NINE_WOOD;
FOUNDATION_EXPORT NSInteger *const TWO_HYBRID;
FOUNDATION_EXPORT NSInteger *const THREE_HYBRID;
FOUNDATION_EXPORT NSInteger *const FOUR_HYBRID;
FOUNDATION_EXPORT NSInteger *const FIVE_HYBRID;
FOUNDATION_EXPORT NSInteger *const SIX_HYBRID;
FOUNDATION_EXPORT NSInteger *const TWO_IRON;
FOUNDATION_EXPORT NSInteger *const THREE_IRON;
FOUNDATION_EXPORT NSInteger *const FOUR_IRON;
FOUNDATION_EXPORT NSInteger *const FIVE_IRON;
FOUNDATION_EXPORT NSInteger *const SIX_IRON;
FOUNDATION_EXPORT NSInteger *const SEVEN_IRON;
FOUNDATION_EXPORT NSInteger *const EIGHT_IRON;
FOUNDATION_EXPORT NSInteger *const NINE_IRON;
FOUNDATION_EXPORT NSInteger *const PW;
FOUNDATION_EXPORT NSInteger *const AW;
FOUNDATION_EXPORT NSInteger *const SW;
FOUNDATION_EXPORT NSInteger *const LW;
FOUNDATION_EXPORT NSInteger *const HLW;

// tee constants
FOUNDATION_EXPORT NSInteger *const AGGIES;
FOUNDATION_EXPORT NSInteger *const MAROONS;
FOUNDATION_EXPORT NSInteger *const COWBELLS;
FOUNDATION_EXPORT NSInteger *const TIPS;

// Course URIs
FOUNDATION_EXPORT NSString *const COURSE_GETALL_URI;
FOUNDATION_EXPORT NSString *const COURSE_INSERT_URI;
FOUNDATION_EXPORT NSString *const COURSE_GETID_URI;
FOUNDATION_EXPORT NSString *const COURSE_UPDATE_URI;
FOUNDATION_EXPORT NSString *const COURSE_DELETE_URI;

// User URIs
FOUNDATION_EXPORT NSString *const USER_GETALL_URI;
FOUNDATION_EXPORT NSString *const USER_INSERT_URI;
FOUNDATION_EXPORT NSString *const USER_GETID_URI;
FOUNDATION_EXPORT NSString *const USER_UPDATE_URI;
FOUNDATION_EXPORT NSString *const USER_DELETE_URI;

// Shot URIs
FOUNDATION_EXPORT NSString *const SHOT_GETALL_URI;
FOUNDATION_EXPORT NSString *const SHOT_INSERT_URI;
FOUNDATION_EXPORT NSString *const SHOT_GETID_URI;
FOUNDATION_EXPORT NSString *const SHOT_UPDATE_URI;
FOUNDATION_EXPORT NSString *const SHOT_DELETE_URI;

// Hole URIs
FOUNDATION_EXPORT NSString *const HOLE_GETALL_URI;
FOUNDATION_EXPORT NSString *const HOLE_INSERT_URI;
FOUNDATION_EXPORT NSString *const HOLE_GETID_URI;
FOUNDATION_EXPORT NSString *const HOLE_UPDATE_URI;
FOUNDATION_EXPORT NSString *const HOLE_DELETE_URI;
FOUNDATION_EXPORT NSString *const HOLE_REFERENCE_URI;

// Round URIs
FOUNDATION_EXPORT NSString *const ROUND_GETALL_URI;
FOUNDATION_EXPORT NSString *const ROUND_INSERT_URI;
FOUNDATION_EXPORT NSString *const ROUND_GETID_URI;
FOUNDATION_EXPORT NSString *const ROUND_UPDATE_URI;
FOUNDATION_EXPORT NSString *const ROUND_DELETE_URI;

@end

