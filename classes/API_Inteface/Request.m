//
//  Request.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Request.h"

@implementation Request

@synthesize _url;
@synthesize _verb;
@synthesize _requestBody;
@synthesize _responseBody;
@synthesize _expectedStatus;
@synthesize _responseStatus;
@synthesize _username;
@synthesize _password;

- (NSString *) url;
{
    return _url;
}

- (NSString *) verb;
{
    return _verb;
}

- (NSString *const) username;
{
    return _username;
}

- (NSString *) password;
{
    return _password;
}

- (NSString *) requestBody;
{
    return _requestBody;
}

- (NSData *) responseBody;
{
    return _responseBody;
}

- (NSUInteger *) responseStatus;
{
    return _responseStatus;
}

- (int) expectedStatus;
{
    return _expectedStatus;
}

- (id) initWithURL: (NSString *) url andStatus: (NSUInteger *) status;
{
    NSLog(@"Constructing a GET request");
    if (self = [super init]) {
        self._url = url;
        self._verb = @"GET";
        self._username = API_USERNAME;
        self._password = API_PASSWORD;
        self._requestBody = nil;
        self._responseBody = nil;
        self._responseStatus = 0;
        self._expectedStatus = (int) status;
    }
    
    return self;
}

- (id) initWithURL: (NSString *) url andRequestBody: (NSString *) body andStatus: (NSUInteger *) status;
{
    NSLog(@"Constructing a POST request");
    if (self = [super init]) {
        self._url = url;
        self._verb = @"POST";
        self._username = API_USERNAME;
        self._password = API_PASSWORD;
        self._requestBody = body;
        self._responseBody = nil;
        self._responseStatus = 0;
        self._expectedStatus = (int) status;
    }
    
    return self;
}

- (BOOL) execute;
{
    NSString *check = [self verb];
    if (check == @"GET") {
        [self executeGet];
    } else if (check == @"POST") {
        [self executePost];
    } else {
        [NSException raise: @"InvalidVerb" format: @"Verb of %@ is invalid", check];
    }
    
    return TRUE;
}

- (BOOL) executeGet;
{
    NSLog(@"Execute get request");
    
    NSDictionary *requestHeaders = [NSDictionary
                                    dictionaryWithObject:@"application/json"
                                    forKey:@"Content-Type"
                                    ];
    
    __block int status = -1;
    
    [[LRResty authenticatedClientWithUsername: [self username]
                                     password: [self password]
      ]
     get: [self url]
     parameters: nil
     headers: requestHeaders
     withBlock: ^(LRRestyResponse *response) {
         if (response.status == [self expectedStatus]) {
             NSLog(@"Response status matched expected status.");
             self._responseStatus = (NSUInteger *) response.status;
             self._responseBody   = response.responseData;
             status = response.status;
         } else {
             NSLog(@"Error in response status not matching. Status: %d", response.status);
         }
         
     }
     ];
    
    while (status == -1)
        [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    
    if ([self responseStatus] != (NSUInteger * ) [self expectedStatus]) {
        return FALSE;
    } else {
        return TRUE;
    }
}

-(BOOL) executePost;
{
    NSLog(@"Execute post request");
    
    NSDictionary *requestHeaders = [NSDictionary
                                    dictionaryWithObject:@"application/json"
                                    forKey:@"Content-Type"
                                    ];
    
    __block int status = -1;
    
    [[LRResty authenticatedClientWithUsername: [self username]
                                     password: [self password]
      ]
     post: [self url]
     payload: [self requestBody]
     headers: requestHeaders
     withBlock: ^(LRRestyResponse *response) {
         if (response.status == [self expectedStatus]) {
             NSLog(@"Response status matched expected status.");
             self._responseStatus = (NSUInteger *) response.status;
             self._responseBody   = response.responseData;
             status = response.status;
         } else {
             NSLog(@"Error in response status not matching. Status: %d", response.status);
         }
     }
     ];
    
    while (status == -1)
        [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    
    if ([self responseStatus] != (NSUInteger *) [self expectedStatus]) {
        return FALSE;
    } else {
        return TRUE;
    }
}

@end
