//
//  Round.m
//  OnPar
//
//  Created by Kevin R Benton on 11/14/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Round.h"

@implementation Round

@synthesize ID;
@synthesize user;
@synthesize course;
@synthesize totalScore;
@synthesize teeID;
@synthesize startTime;
@synthesize holes;

- (id) construct: (NSObject *) data;
{
    if (data != nil) {
        if ([data isKindOfClass: [NSDictionary class]] || [data isKindOfClass: [NSNumber class]]) {
            return [self init: data];
        } else {
            // unsuported type
            return nil;
        }
    } else {
        return [self init];
    }
}

- (id) init;
{
    if (self = [super init]) {
        self.ID =         nil;
        self.user =       nil;
        self.course =     nil;
        self.totalScore = nil;
        self.teeID =      nil;
        self.startTime =  nil;
        self.holes =      nil;
    }
    
    return self;
}

- (id) init: (NSObject *) data;
{
    if (self = [super init]) {
        if ([data isKindOfClass: [NSDictionary class]]) {
            [self fillVariables: (NSDictionary *) data];
        } else if ([data isKindOfClass: [NSNumber class]]) {
            // format the URL to include the ID at the end
            NSString *path = [NSString stringWithFormat: @"%@%@", @"rounds/", data];
            
            // construct and execute the request
            Request *r = [[Request alloc] init: path body: nil];
            
            BOOL check = [r execute];
            
            if (check) {
                // check the status
                if (r.response.status == 200) {
                    // decode the json
                    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
                    NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
                    
                    [self fillVariables: jsonObject];
                } else if (r.response.status == 204) {
                    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Round Error"
                                                                      message:@"This Round does not exist."
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil];
                    [message show];
                    
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
    NSArray *round = [data valueForKey: @"round"];
    
    NSMutableArray *holeArray = [[NSMutableArray alloc] init];
    for (NSDictionary *hole in [round valueForKey: @"holes"]) {
        [holeArray addObject: [[Hole alloc] construct: hole]];
    }
    
    self.ID =         [[NSNumber alloc] initWithInt: [[round valueForKey: @"id"] intValue]];
    self.teeID =      [[NSNumber alloc] initWithInt: [[round valueForKey: @"teeID"] intValue]];
    self.totalScore = [[NSNumber alloc] initWithInt: [[round valueForKey: @"totalScore"] intValue]];
    self.startTime =  [round valueForKey: @"startTime"];
    self.user =       [[User alloc] construct: [round valueForKey: @"user"]];
    self.course =     [[Course alloc] construct: [round valueForKey: @"course"]];
    self.holes =      holeArray;
}

- (BOOL) save;
{
    NSString *path = @"rounds/";
    
    if (self.ID) {
        // update
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
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Round Error"
                                                              message:@"Please insert all required fields."
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
    // udelete the round
    // format the URL to include the ID at the end
    NSString *path = [NSString stringWithFormat: @"%@%@", @"rounds/destroy", self.ID];
    
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
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Round Error"
                                                              message:@"This Round does not exist."
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
    NSMutableArray *holeArray = [[NSMutableArray alloc] init];
    for (Hole *h in [self holes]) {
        [holeArray addObject: [h export]];
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject: self.ID ? self.ID : [NSNull null] forKey: @"id"];
    [params setObject: self.teeID ? self.teeID : [NSNull null] forKey: @"teeID"];
    [params setObject: self.totalScore ? self.totalScore : [NSNull null] forKey: @"totalScore"];
    [params setObject: self.startTime ? self.startTime : [NSNull null] forKey: @"startTime"];
    [params setObject: self.user ? [self.user export] : [NSNull null] forKey: @"user"];
    [params setObject: self.course ? [self.course export] : [NSNull null] forKey: @"course"];
    [params setObject: holeArray forKey: @"holes"];
    
    NSDictionary *round = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"round" , nil];
    
    return round;
}

+ (Round *) startNowWithUser: (User *) u onCourse: (Course *) c fromTee: (NSNumber *) t;
{
    Round *round = [[Round alloc] init];
    
    round.user = u;
    round.course = c;
    round.teeID = t;
    
    NSDateFormatter *formatter;
    NSString        *dateString;
     
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     
    dateString = [formatter stringFromDate:[NSDate date]];
    
    round.startTime  = dateString;
    
    NSString *path = [NSString stringWithFormat: @"%@%@%@%@", @"holes/reference/", round.course.ID, @"/", round.teeID];
    
    // construct and execute the request
    Request *r = [[Request alloc] init: path body: nil];
    
    if ([r execute]) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
        NSDictionary *JSONholes = [jsonObject valueForKey: @"holes"];
        NSMutableArray *holeArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *hole in JSONholes) {
            [holeArray addObject: [[Hole alloc] construct: hole]];
        }

        round.holes = holeArray;
    }
    
    return round;
}

@end
