//
//  RoundGetAll.m
//  OnPar
//
//  Created by Kevin R Benton on 2/11/13.
//  Copyright (c) 2013 Mississippi State. All rights reserved.
//

#import "RoundGetAll.h"

@implementation RoundGetAll

@synthesize rounds;
@synthesize nextPage;
@synthesize userID;
@synthesize path;

- (id) init: (NSNumber *) data;
{
    if (self = [super init]) {
        self.nextPage = [NSNumber numberWithInt: 1];
        self.rounds = [[NSMutableArray alloc] init];
        
        if (data) {
            self.userID = data;
            self.path = [NSString stringWithFormat: @"%@%@%@", @"rounds/user/", self.userID, @"/"];
        } else {
            self.userID = nil;
            self.path = @"rounds/all/";
        }
        
        [self next];
    }
    
    return self;
}

- (void) next;
{
    if (![self.nextPage isEqual: [NSNull null]]) {
        Request *r = [[Request alloc] init: [NSString stringWithFormat: @"%@%@", self.path, self.nextPage] body: nil];
        
        if ([r execute]) {
            // check the status
            if (r.response.status == 200) {
                // decode the json
                SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
                NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
                NSDictionary *JSONrounds = [jsonObject valueForKey: @"rounds"];
                self.nextPage = [jsonObject valueForKey: @"nextPage"] ? [jsonObject valueForKey: @"nextPage"] : nil;
                
                for (NSDictionary *round in JSONrounds) {
                    Round *r = [[Round alloc] construct: nil];
                    r.ID = [round valueForKey: @"id"];
                    r.startTime = [round valueForKey: @"startTime"];
                    
                    [self.rounds addObject: r];
                }
            }
        }
    }
}

@end
