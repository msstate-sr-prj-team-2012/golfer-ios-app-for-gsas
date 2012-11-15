//
//  User.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize _uid;
@synthesize _roles;
@synthesize _username;
@synthesize _password;
@synthesize _name;
@synthesize _email;

- (id) construct: (int) data;
{
    NSLog(@"User constructor called");
    if (data == 0) {
        return [self init];
    } else {
        return [self initLoad: data];
    }
}

- (int) uid;
{
    return _uid;
}

- (int) roles;
{
    return _roles;
}

- (NSString *) username;
{
    return _username;
}

- (NSString *) password;
{
    return _password;
}

- (NSString *) name;
{
    return _name;
}

- (NSString *) email;
{
    return _email;
}


- (id) init;
{
    NSLog(@"User constructor called. No data be retreived from the API.");
    if (self = [super init]) {
        self._uid = 0;
        self._roles = 0;
        self._username = nil;
        self._password = nil;
        self._name = nil;
        self._email = nil;
    }
    
    return self;
}

- (id) initLoad: (int) data;
{
    NSLog(@"User constructor called with ID. Data being retrieved from the API.");
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", USER_GETID_URI, data];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                                    andStatus: (NSUInteger *) 200];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *user = [jsonObject valueForKey: @"user"];
        
        // call the constructor with all the values
        User *this = [[User alloc] init];
        
        this._uid      = [[user valueForKey: @"id"] intValue];
        this._roles    = [[user valueForKey: @"roles"] intValue];
        this._username = [user valueForKey: @"username"];
        this._password = [user valueForKey: @"password"];
        this._name     = [user valueForKey: @"name"];
        this._email    = [user valueForKey: @"email"];
        
        return this;
    } else {
        return [self init];
    }
}

- (id) initByUsername: (NSString *) data;
{
    NSLog(@"User constructor called with username. Data being retrieved from the API.");
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%@", USER_GETID_URI, data];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                                    andStatus: (NSUInteger *) 200];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *user = [jsonObject valueForKey: @"user"];
        
        // call the constructor with all the values
        User *this = [[User alloc] init];
        
        this._uid      = [[user valueForKey: @"id"] intValue];
        this._roles    = [[user valueForKey: @"roles"] intValue];
        this._username = [user valueForKey: @"username"];
        this._password = [user valueForKey: @"password"];
        this._name     = [user valueForKey: @"name"];
        this._email    = [user valueForKey: @"email"];
        
        return this;
    } else {
        return [self init];
    }
}

- (BOOL) save;
{
    if ([self uid] == (int) nil) {
        // insert a new user
        NSLog(@"Inserting a new user");
        
        // construct and execute the request
        Request *r = [[Request alloc] initWithURL: USER_INSERT_URI
                                   andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                        andStatus: (NSUInteger *) 201
                      ];
        BOOL check = [r execute];
        
        if (check) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
            NSArray *user = [jsonObject valueForKey: @"user"];
            
            self._uid = [[user valueForKey: @"id"] intValue];
            self._roles = [[user valueForKey: @"roles"] intValue];
            self._username = [user valueForKey: @"username"];
            self._password = [user valueForKey: @"password"];
            self._name = [user valueForKey: @"name"];
            self._email = [user valueForKey: @"email"];
        }
        
        return check;
        
    } else {
        // update the user
        NSLog(@"Updating user with ID: %d", [self uid]);
        
        // format the URL to include the ID at the end
        NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", USER_UPDATE_URI, [self uid]];
        
        // construct and execute the request
        Request *r = [[Request alloc] initWithURL: formattedUrl
                                   andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                        andStatus: (NSUInteger *) 200
                      ];
        BOOL check = [r execute];
        
        if (check) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
            NSArray *user = [jsonObject valueForKey: @"user"];
            
            self._uid = [[user valueForKey: @"id"] intValue];
            self._roles = [[user valueForKey: @"roles"] intValue];
            self._username = [user valueForKey: @"username"];
            self._password = [user valueForKey: @"password"];
            self._name = [user valueForKey: @"name"];
            self._email = [user valueForKey: @"email"];
        }
        
        return check;
        
    }
}

- (BOOL) del;
{
    // delete the user
    NSLog(@"Deleting user with ID: %d", [self uid]);
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", USER_DELETE_URI, [self uid]];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                               andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                    andStatus: (NSUInteger *) 200
                  ];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *user = [jsonObject valueForKey: @"user"];
        
        self._uid = [[user valueForKey: @"id"] intValue];
        self._roles = [[user valueForKey: @"roles"] intValue];
        self._username = [user valueForKey: @"username"];
        self._password = [user valueForKey: @"password"];
        self._name = [user valueForKey: @"name"];
        self._email = [user valueForKey: @"email"];
    }
    
    return check;
}

- (NSDictionary *) export;
{
    NSLog(@"Exporting user object");
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt: [self uid]], @"id",
                            [NSNumber numberWithInt: [self roles]], @"roles",
                            [self username], @"username",
                            [self password], @"password",
                            [self name], @"name",
                            [self email], @"email",
                            nil
                            ];
    
    NSDictionary *user = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"user" , nil];
    
    return user;
}

+ (NSMutableArray *) getAll;
{
    NSLog(@"Retreiving all users");
    
    NSMutableArray *retUsers = [[NSMutableArray alloc] init];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: USER_GETALL_URI
                                    andStatus: (NSUInteger *) 200];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *users = [jsonObject valueForKey: @"users"];
        
        for (NSDictionary *dict in users) {
            NSArray *user = [dict valueForKey: @"user"];
            
            User *this = [[User alloc] init];
            
            this._uid      = [[user valueForKey: @"id"] intValue];
            this._roles    = [[user valueForKey: @"roles"] intValue];
            this._username = [user valueForKey: @"username"];
            this._password = [user valueForKey: @"password"];
            this._name     = [user valueForKey: @"name"];
            this._email    = [user valueForKey: @"email"];
            
            [retUsers addObject: this];
        }
        
        
    } else {
        retUsers = [[NSMutableArray alloc] init];
    }
    
    return retUsers;
}

@end
