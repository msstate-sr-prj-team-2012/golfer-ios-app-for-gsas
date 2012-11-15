//
//  defines.m
//  OnPar
//
//  Created by Kevin R Benton on 11/12/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "defines.h"

@implementation defines

NSString *const API_USERNAME = @"cse3213";
NSString *const API_PASSWORD = @"test";

NSInteger *const DRIVER       = 1;
NSInteger *const THREE_WOOD   = 2;
NSInteger *const FOUR_WOOD    = 3;
NSInteger *const FIVE_WOOD    = 4;
NSInteger *const SEVEN_WOOD   = 5;
NSInteger *const NINE_WOOD    = 6;
NSInteger *const TWO_HYBRID   = 7;
NSInteger *const THREE_HYBRID = 8;
NSInteger *const FOUR_HYBRID  = 9;
NSInteger *const FIVE_HYBRID  = 10;
NSInteger *const SIX_HYBRID   = 11;
NSInteger *const TWO_IRON     = 12;
NSInteger *const THREE_IRON   = 13;
NSInteger *const FOUR_IRON    = 14;
NSInteger *const FIVE_IRON    = 15;
NSInteger *const SIX_IRON     = 16;
NSInteger *const SEVEN_IRON   = 17;
NSInteger *const EIGHT_IRON   = 18;
NSInteger *const NINE_IRON    = 19;
NSInteger *const PW           = 20;
NSInteger *const AW           = 21;
NSInteger *const SW           = 22;
NSInteger *const LW           = 23;
NSInteger *const HLW          = 24;

NSInteger *const AGGIES    = 1;
NSInteger *const MAROONS   = 2;
NSInteger *const COWBELLS  = 3;
NSInteger *const TIPS      = 4;

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
