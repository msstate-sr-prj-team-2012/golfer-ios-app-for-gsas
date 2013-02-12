
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class Course
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent Course.
 * Can represent a Course already in the database through the API or
 * can represent a Course not in the database that can be saved to the
 * database.
 *
 * USAGE
 *
 * For new Course
 * Course *course = [[Course alloc] construct: nil];
 *
 * For existing Course
 * Course *course = [[Course alloc] construct: [NSNumber numberWithInt: courseID]];
 */

#import "Course.h"

@implementation Course

@synthesize ID;
@synthesize name;
@synthesize location;

- (id) construct: (NSObject *) data;
{
    if (data != nil) {
        if ([data isKindOfClass: [NSDictionary class]] || [data isKindOfClass: [NSNumber class]]) {
            return [self init: data];
        } else {
            return nil;
        }
    } else {
        return [self init];
    }
}

- (id) init;
{
    if (self = [super init]) {
        self.ID =       nil;
        self.name =     nil;
        self.location = nil;
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
            NSString *path = [NSString stringWithFormat: @"%@%@", @"courses/", data];
        
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
                    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Course Error"
                                                                      message:@"This Course does not exist."
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
                return nil;
            }
        } else {
            return nil;
        }
        
        return self;
        
    } else {
        return nil;
    }
}

- (void) fillVariables: (NSDictionary *) data;
{
    NSDictionary *course = [data valueForKey: @"course"];
    
    self.ID =       [[NSNumber alloc] initWithInt: [[course valueForKey: @"id"] intValue]];
    self.name =     [course valueForKey: @"name"];
    self.location = [course valueForKey: @"location"];
}

- (BOOL) save;
{
    NSString *path = @"courses/";
    
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
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Course Error"
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
    // delete the course
    // format the URL to include the ID at the end
    NSString *path = [NSString stringWithFormat: @"%@%@", @"courses/destroy/", self.ID];
    
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
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Course Error"
                                                              message:@"This Course does not exist."
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
    [params setObject: self.name ? self.name : [NSNull null] forKey: @"name"];
    [params setObject: self.location ? self.location : [NSNull null] forKey: @"location"];
    
    NSDictionary *course = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"course" , nil];
    
    return course;
}

+ (NSArray *) getAll;
{
    NSMutableArray *retCourses = [[NSMutableArray alloc] init];
    
    NSString *path = @"courses/";
    
    // construct and execute the request
    Request *r = [[Request alloc] init: path body: nil];
    
    if ([r execute]) {
        // decode the json
        SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
        NSDictionary *jsonObject = [jsonParser objectWithData: r.response.responseData];
        NSDictionary *courses = [jsonObject valueForKey: @"courses"];
        
        for (NSDictionary *course in courses) {
            [retCourses addObject: [[Course alloc] construct: course]];
        }
        
        
    } else {
        retCourses = [[NSMutableArray alloc] init];
    }
    
    return [[NSArray alloc] initWithArray: retCourses];
    
}

@end
