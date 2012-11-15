//
//  Course.m
//  OnPar
//
//  Created by Kevin R Benton on 11/12/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Course.h"

@implementation Course

@synthesize _cid;
@synthesize _name;
@synthesize _location;

- (id) construct: (int) data;
{
    NSLog(@"Course constructor called");
    if (data == 0) {
        return [self init];
    } else {
        return [self initLoad: data];
    }
}

- (int) cid;
{
    return _cid;
}

- (NSString *) name;
{
    return _name;
}

- (NSString *) location;
{
    return _location;
}

- (id) init;
{
    NSLog(@"Course constructor called. No data being retrieved from API.");
    if (self = [super init]) {
        self._cid = 0;
        self._name = nil;
        self._location = nil;
    }
    
    return self;
}

- (id) initLoad: (int) data;
{
    NSLog(@"Course constructor called with ID. Data being retrieved from the API.");
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", COURSE_GETID_URI, data];
   
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                                    andStatus: 200];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *course = [jsonObject valueForKey: @"course"];
    
        // call the constructor with all the values
        Course *this = [[Course alloc] init];
        
        this._cid = [[course valueForKey: @"id"] intValue];
        this._name = [course valueForKey: @"name"];
        this._location = [course valueForKey: @"location"];
        
        return this;
        
    } else {
        return [self init];
    }

}

- (BOOL) save;
{
    if ([self cid] == nil) {
        // insert a new course
        NSLog(@"Inserting a new course");
        
        // construct and execute the request
        Request *r = [[Request alloc] initWithURL: COURSE_INSERT_URI
                                   andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                        andStatus: 201
                      ];
        BOOL check = [r execute];
        
        if (check) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
            NSArray *course = [jsonObject valueForKey: @"course"];
            
            self._cid = [[course valueForKey: @"id"] intValue];
            self._name = [course valueForKey: @"name"];
            self._location = [course valueForKey: @"location"];
        }
        
        return check;
        
    } else {
        // update the course
        NSLog(@"Updating course with ID: %d", [self cid]);
        
        // format the URL to include the ID at the end
        NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", COURSE_UPDATE_URI, [self cid]];
        
        // construct and execute the request
        Request *r = [[Request alloc] initWithURL: formattedUrl
                                   andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                        andStatus: 200
                      ];
        BOOL check = [r execute];
        
        if (check) {
            // decode the json
            SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
            NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
            NSArray *course = [jsonObject valueForKey: @"course"];
            
            self._cid = [[course valueForKey: @"id"] intValue];
            self._name = [course valueForKey: @"name"];
            self._location = [course valueForKey: @"location"];
        }
        
        return check;

    }
    
}

- (BOOL) del;
{
    // delete the course
    NSLog(@"Deleting course with ID: %d", [self cid]);
    
    // format the URL to include the ID at the end
    NSString* formattedUrl = [NSString stringWithFormat: @"%@%d", COURSE_DELETE_URI, [self cid]];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: formattedUrl
                               andRequestBody: [[SBJsonWriter alloc] stringWithObject: [self export]]
                                    andStatus: 200
                  ];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *course = [jsonObject valueForKey: @"course"];
        
        self._cid = [[course valueForKey: @"id"] intValue];
        self._name = [course valueForKey: @"name"];
        self._location = [course valueForKey: @"location"];
    }
    
    return check;
}

- (NSDictionary *) export;
{
    NSLog(@"Exporting course object");
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt: [self cid]], @"id",
                            [self name], @"name",
                            [self location], @"location",
                            nil
              ];
    
    NSDictionary *course = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"course" , nil];
    
    return course;
}

+ (NSMutableArray *) getAll;
{
    NSLog(@"Retreiving all courses");
    
    NSMutableArray *retCourses = [[NSMutableArray alloc] init];
    
    // construct and execute the request
    Request *r = [[Request alloc] initWithURL: COURSE_GETALL_URI
                                    andStatus: 200];
    BOOL check = [r execute];
    
    if (check) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSArray *jsonObject = [jsonParser objectWithData: [r responseBody]];
        NSArray *courses = [jsonObject valueForKey: @"courses"];
        
        for (NSDictionary *dict in courses) {
            NSArray *course = [dict valueForKey: @"course"];
            
            Course *this = [[Course alloc] init];
            
            this._cid = [[course valueForKey: @"id"] intValue];
            this._name = [course valueForKey: @"name"];
            this._location = [course valueForKey: @"location"];
            
            [retCourses addObject: this];
        }
        
        
    } else {
        retCourses = [[NSMutableArray alloc] init];
    }
    
    return retCourses;
    
}

@end
