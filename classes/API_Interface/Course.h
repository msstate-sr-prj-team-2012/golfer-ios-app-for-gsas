//
//  Course.h
//  OnPar
//
//  Created by Kevin R Benton on 11/12/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface Course : NSObject

@property (nonatomic) int _cid;
@property (nonatomic, copy) NSString *_name;
@property (nonatomic, copy) NSString *_location;

- (int) cid;
- (NSString *) name;
- (NSString *) location;

- (id) construct: (int) data;

- (id) init;

- (id) initLoad: (int) data;
- (BOOL) save;
- (BOOL) del;
- (NSDictionary *) export;

+ (NSMutableArray *) getAll;

@end
