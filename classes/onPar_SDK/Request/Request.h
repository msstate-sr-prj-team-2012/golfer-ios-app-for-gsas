//
//  Request.h
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "Reachability.h"
#import "SBJson.h"

@interface Request : NSObject

@property (nonatomic, copy)   NSString        *path;
@property (nonatomic, copy)   NSString        *url;
@property (nonatomic, copy)   NSString        *method;
@property (nonatomic, copy)   NSDictionary    *requestBody;
@property (nonatomic, copy)   NSDictionary    *requestHeaders;
@property (nonatomic, retain) LRRestyResponse *response;
@property (nonatomic, retain) Reachability    *reach;

- (id) init: (NSString *) resourcePath body: (NSDictionary *) body;

- (BOOL) execute;
- (BOOL) executeGet;
- (BOOL) executePost;

@end
