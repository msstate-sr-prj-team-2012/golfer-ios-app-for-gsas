//
//  defines.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "defines.h"

@implementation defines

NSString *const API_USERNAME = @"cse3213";
NSString *const API_PASSWORD = @"test";

NSInteger *const DRIVER       = (NSInteger *const) 1;
NSInteger *const THREE_WOOD   = (NSInteger *const) 2;
NSInteger *const FOUR_WOOD    = (NSInteger *const) 3;
NSInteger *const FIVE_WOOD    = (NSInteger *const) 4;
NSInteger *const SEVEN_WOOD   = (NSInteger *const) 5;
NSInteger *const NINE_WOOD    = (NSInteger *const) 6;
NSInteger *const TWO_HYBRID   = (NSInteger *const) 7;
NSInteger *const THREE_HYBRID = (NSInteger *const) 8;
NSInteger *const FOUR_HYBRID  = (NSInteger *const) 9;
NSInteger *const FIVE_HYBRID  = (NSInteger *const) 10;
NSInteger *const SIX_HYBRID   = (NSInteger *const) 11;
NSInteger *const TWO_IRON     = (NSInteger *const) 12;
NSInteger *const THREE_IRON   = (NSInteger *const) 13;
NSInteger *const FOUR_IRON    = (NSInteger *const) 14;
NSInteger *const FIVE_IRON    = (NSInteger *const) 15;
NSInteger *const SIX_IRON     = (NSInteger *const) 16;
NSInteger *const SEVEN_IRON   = (NSInteger *const) 17;
NSInteger *const EIGHT_IRON   = (NSInteger *const) 18;
NSInteger *const NINE_IRON    = (NSInteger *const) 19;
NSInteger *const PW           = (NSInteger *const) 20;
NSInteger *const AW           = (NSInteger *const) 21;
NSInteger *const SW           = (NSInteger *const) 22;
NSInteger *const LW           = (NSInteger *const) 23;
NSInteger *const HLW          = (NSInteger *const) 24;

NSInteger *const AGGIES    = (NSInteger *const) 1;
NSInteger *const MAROONS   = (NSInteger *const) 2;
NSInteger *const COWBELLS  = (NSInteger *const) 3;
NSInteger *const TIPS      = (NSInteger *const) 4;

NSString *const COURSE_GETALL_URI = @"http://shadowrealm.cse.msstate.edu/API/courses/";
NSString *const COURSE_INSERT_URI = @"http://shadowrealm.cse.msstate.edu/API/courses/";
NSString *const COURSE_GETID_URI  = @"http://shadowrealm.cse.msstate.edu/API/courses/index.php/";
NSString *const COURSE_UPDATE_URI = @"http://shadowrealm.cse.msstate.edu/API/courses/index.php/";
NSString *const COURSE_DELETE_URI = @"http://shadowrealm.cse.msstate.edu/API/courses/index.php/destroy/";

NSString *const USER_GETALL_URI = @"http://shadowrealm.cse.msstate.edu/API/users/";
NSString *const USER_INSERT_URI = @"http://shadowrealm.cse.msstate.edu/API/users/";
NSString *const USER_GETID_URI  = @"http://shadowrealm.cse.msstate.edu/API/users/index.php/";
NSString *const USER_UPDATE_URI = @"http://shadowrealm.cse.msstate.edu/API/users/index.php/";
NSString *const USER_DELETE_URI = @"http://shadowrealm.cse.msstate.edu/API/users/index.php/destroy/";

NSString *const SHOT_GETALL_URI = @"http://shadowrealm.cse.msstate.edu/API/shots/";
NSString *const SHOT_INSERT_URI = @"http://shadowrealm.cse.msstate.edu/API/shots/";
NSString *const SHOT_GETID_URI  = @"http://shadowrealm.cse.msstate.edu/API/shots/index.php/";
NSString *const SHOT_UPDATE_URI = @"http://shadowrealm.cse.msstate.edu/API/shots/index.php/";
NSString *const SHOT_DELETE_URI = @"http://shadowrealm.cse.msstate.edu/API/shots/index.php/destroy/";

NSString *const HOLE_GETALL_URI = @"http://shadowrealm.cse.msstate.edu/API/holes/";
NSString *const HOLE_INSERT_URI = @"http://shadowrealm.cse.msstate.edu/API/holes/index.php/";
NSString *const HOLE_GETID_URI  = @"http://shadowrealm.cse.msstate.edu/API/holes/index.php/";
NSString *const HOLE_UPDATE_URI = @"http://shadowrealm.cse.msstate.edu/API/holes/index.php/";
NSString *const HOLE_DELETE_URI = @"http://shadowrealm.cse.msstate.edu/API/holes/index.php/destroy/";
NSString *const HOLE_REFERENCE_URI = @"http://shadowrealm.cse.msstate.edu/API/holes/index.php/reference/";

NSString *const ROUND_GETALL_URI = @"http://shadowrealm.cse.msstate.edu/API/rounds/";
NSString *const ROUND_INSERT_URI = @"http://shadowrealm.cse.msstate.edu/API/rounds/";
NSString *const ROUND_GETID_URI  = @"http://shadowrealm.cse.msstate.edu/API/rounds/index.php/";
NSString *const ROUND_UPDATE_URI = @"http://shadowrealm.cse.msstate.edu/API/rounds/index.php/";
NSString *const ROUND_DELETE_URI = @"http://shadowrealm.cse.msstate.edu/API/rounds/index.php/destroy/";

@end
