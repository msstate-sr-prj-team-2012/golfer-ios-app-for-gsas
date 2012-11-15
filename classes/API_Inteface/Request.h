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

@interface Request : NSObject

@property (nonatomic, copy) NSString *_url;
@property (nonatomic, copy) NSString *_verb;
@property (nonatomic, copy) NSString *_requestBody;
@property (nonatomic, copy) NSData *_responseBody;
@property (nonatomic)       int     _expectedStatus;
@property (nonatomic)       NSUInteger *_responseStatus;
@property (nonatomic, copy) NSString *_username;
@property (nonatomic, copy) NSString *_password;

- (NSString *) url;
- (NSString *) verb;
- (NSString *) username;
- (NSString *) password;
- (NSString *) requestBody;
- (NSData *) responseBody;
- (NSUInteger *) responseStatus;
- (int) expectedStatus;

- (id) initWithURL: (NSString *) url andStatus: (NSUInteger *) status;
- (id) initWithURL: (NSString *) url andRequestBody: (NSString *) body andStatus: (NSUInteger *) status;

- (BOOL) execute;
- (BOOL) executeGet;
- (BOOL) executePost;

@end
