//
//  User.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize ID;
@synthesize memberID;
@synthesize nickname;
@synthesize name;
@synthesize email;

- (id) init;
{
    if (self = [super init]) {
        self.ID = nil;
        self.memberID = nil;
        self.nickname = nil;
        self.name = nil;
        self.email = nil;
    }
    
    return self;
}

- (id) construct: (NSObject *) data;
{
    if (data != nil) {
        if ([data isKindOfClass: [NSDictionary class]] || [data isKindOfClass: [NSNumber class]] ||
            [data isKindOfClass: [NSString class]]) {
            return [self init: data];
        } else {
            // unsuported type
            return nil;
        }
    } else {
        return [self init];
    }
}

- (id) init: (NSObject *) data;
{
    if (self = [super init]) {
        if ([data isKindOfClass: [NSDictionary class]]) {
            [self fillVariables: (NSDictionary *) data];
        } else if ([data isKindOfClass: [NSNumber class]] || [data isKindOfClass: [NSString class]]) {
            // format the URL to include the ID at the end
            NSString *path = [NSString stringWithFormat: @"%@%@", @"users/", data];
    
            // construct and execute the request
            Request *r = [[Request alloc] init: path body: nil];
            
            if ([r execute]) {
                // check the status
                if (r.response.status == 200) {
                    // decode the json
                    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
                    NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
                    
                    [self fillVariables: jsonObject];
                } else if (r.response.status == 204) {
                    if ([data isKindOfClass: [NSString class]]) {
                        NSString *search = [NSString stringWithFormat: @"%@", data];
                        if ([search rangeOfString: @"@"].location == NSNotFound) {
                            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"User Error"
                                                                              message:@"This User memberID does not exist."
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"OK"
                                                                    otherButtonTitles:nil];
                            [message show];
                        } else {
                            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"User Error"
                                                                              message:@"This User email does not exist."
                                                                             delegate:nil
                                                                    cancelButtonTitle:@"OK"
                                                                    otherButtonTitles:nil];
                            [message show];
                        }
                    } else if ([data isKindOfClass: [NSNumber class]]) {
                        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"User Error"
                                                                          message:@"This User ID does not exist."
                                                                         delegate:nil
                                                                cancelButtonTitle:@"OK"
                                                                otherButtonTitles:nil];
                        [message show];
                    } else {
                        // something went terribly wrong here if it reaches this
                        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Unknown Error"
                                                                          message:@"Something went terribly wrong."
                                                                         delegate:nil
                                                                cancelButtonTitle:@"OK"
                                                                otherButtonTitles:nil];
                        [message show];
                    }
                    
                    return nil;
                } else {
                    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Unknown Error"
                                                                      message:@"Something went terribly wrong."
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
                    [message show];
                    
                    return nil;
                }
            } else {
                self = nil;
            }
        }
        
        return self;
    } else {
        return nil;
    }
}

- (void) fillVariables: (NSDictionary *) data;
{
    NSDictionary *user = [data valueForKey: @"user"];
        
    self.ID =        [[NSNumber alloc] initWithInt: [[user valueForKey: @"id"] intValue]];
    self.memberID =  [user valueForKey: @"memberID"];
    self.nickname =  [user valueForKey: @"nickname"];
    self.name =      [user valueForKey: @"name"];
    self.email =     [user valueForKey: @"email"];
}

- (BOOL) save;
{
    NSString *path = @"users/";
    
    if (self.ID) {
        path = [NSString stringWithFormat: @"%@%@", path, self.ID];
    }
        
    // construct and execute the request
    Request *r = [[Request alloc] init: path body: [self export]];
    
    BOOL check = [r execute];
    
    if (check) {
        if (r.response.status == 200 || r.response.status == 201) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
            
            [self fillVariables: jsonObject];
        } else if (r.response.status == 400) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"User Error"
                                                              message:@"Please insert all required information."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
            
            check = NO;
        } else {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Unknown Error"
                                                              message:@"Something went terribly wrong."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
            
            check = NO;
        }
    }
        
    return check;
}

- (BOOL) del;
{
    // delete the user
    // format the URL to include the ID at the end
    NSString *path = [NSString stringWithFormat: @"%@%@", @"users/destroy/", self.ID];
    
    // construct and execute the request
    Request *r = [[Request alloc] init: path body: [self export]];
    
    BOOL check = [r execute];
    
    if (check) {
        // check the status
        if (r.response.status == 200) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
            
            [self fillVariables: jsonObject];
        } else if (r.response.status == 204) {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"User Error"
                                                              message:@"This User does not exist."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
            
            check = NO;
        } else {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Unknown Error"
                                                              message:@"Something went terribly wrong."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil];
            [message show];
            
            check = NO;
        }
    }
    
    return check;
}

- (NSDictionary *) export;
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject: self.ID ? self.ID : [NSNull null] forKey: @"id"];
    [params setObject: self.memberID ? self.memberID : [NSNull null] forKey: @"memberID"];
    [params setObject: self.nickname ? self.nickname : [NSNull null] forKey: @"nickname"];
    [params setObject: self.name ? self.name : [NSNull null] forKey: @"name"];
    [params setObject: self.email ? self.email : [NSNull null] forKey: @"email"];
    
    NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"user" , nil];
    
    return user;
}

+ (NSArray *) getAll;
{
    NSMutableArray *retUsers = [[NSMutableArray alloc] init];
    
    NSString *path = @"users/";
    
    // construct and execute the request
    Request *r = [[Request alloc] init: path body: nil];
    
    if ([r execute]) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
        NSDictionary *users = [jsonObject valueForKey: @"users"];
        
        for (NSDictionary *user in users) {
            [retUsers addObject: [[User alloc] construct: user]];
        }
        
    } else {
        retUsers = [[NSMutableArray alloc] init];
    }
    
    return [[NSArray alloc] initWithArray: retUsers];
}

@end