//
//  User.h
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

@interface User : NSObject

// private attributes
@property (nonatomic)       NSNumber *ID;
@property (nonatomic, copy) NSString *memberID;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;

// public methods
- (id) construct: (NSObject *) data;
- (BOOL) save;
- (BOOL) del;
+ (NSArray *) getAll;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (NSDictionary *) export;
- (void) fillVariables: (NSDictionary *) data;

@end
