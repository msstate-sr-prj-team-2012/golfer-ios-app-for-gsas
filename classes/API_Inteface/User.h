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

@property (nonatomic) int _uid;
@property (nonatomic) int _roles;
@property (nonatomic, copy) NSString *_username;
@property (nonatomic, copy) NSString *_password;
@property (nonatomic, copy) NSString *_name;
@property (nonatomic, copy) NSString *_email;

- (int) uid;
- (int) roles;
- (NSString *) username;
- (NSString *) password;
- (NSString *) name;
- (NSString *) email;

- (id) construct: (int) data;

- (id) init;

- (id) initLoad: (int) data;
- (id) initByUsername: (NSString *) data;
- (BOOL) save;
- (BOOL) del;
- (NSDictionary *) export;

+ (NSMutableArray *) getAll;

@end
