//
//  Course.h
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

@interface Course : NSObject

// public attributes
@property (nonatomic)       NSNumber *ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;

// public methods
- (id) construct: (NSObject *) data;
- (BOOL) save;
- (BOOL) del;
+ (NSArray *) getAll;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (void) fillVariables: (NSDictionary *) data;
- (NSDictionary *) export;

@end
