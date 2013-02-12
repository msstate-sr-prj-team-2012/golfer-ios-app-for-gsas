
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class Shot
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent a golf shot.
 * Generally used in Holes. Will not be instantiated directly.
 *
 * To create a new Shot to add to a hole,
 *
 * Shot *shot = [[Shot alloc] construct: nil];
 *
 * Then set all of the variables, there are no optional ones.
 * Finally add the Shot to the hole,
 *
 * [hole.shots addObject: shot];
 */

#import "Shot.h"

@implementation Shot

@synthesize ID;
@synthesize holeID;
@synthesize club;
@synthesize shotNumber;
@synthesize aimLatitude;
@synthesize aimLongitude;
@synthesize startLatitude;
@synthesize startLongitude;
@synthesize endLatitude;
@synthesize endLongitude;

- (id) construct: (NSObject *) data;
{
    if (data != nil) {
        if ([data isKindOfClass: [NSDictionary class]]) {
            return [self init: (NSDictionary *) data];
        } else {
            // unsupported type
            return nil;
        }
    } else {
        return [self init];
    }
}

- (id) init;
{
    if (self = [super init]) {
        self.ID = nil;
        self.holeID = nil;
        self.club = nil;
        self.shotNumber = nil;
        self.aimLatitude = nil;
        self.aimLongitude = nil;
        self.startLatitude = nil;
        self.startLongitude = nil;
        self.endLatitude = nil;
        self.endLongitude = nil;
    }
    
    return self;
}

- (id) init: (NSDictionary *) data;
{
    if (self = [super init]) {
        if (data == nil) {
            self = [self init];
        } else {
            [self fillVariables: data];
        }
        
        return self;
    } else {
        return nil;
    }
}

- (void) fillVariables: (NSDictionary *) data;
{
    NSDictionary *shot = [data valueForKey: @"shot"];
    
    self.ID             = [[NSNumber alloc] initWithInt: [[shot valueForKey: @"id"] intValue]];
    self.holeID         = [[NSNumber alloc] initWithInt: [[shot valueForKey: @"holeID"] intValue]];
    self.club           = [[NSNumber alloc] initWithInt: [[shot valueForKey: @"club"] intValue]];
    self.shotNumber     = [[NSNumber alloc] initWithInt: [[shot valueForKey: @"shotNumber"] intValue]];
    self.aimLatitude    = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"aimLatitude"] doubleValue]];
    self.aimLongitude   = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"aimLongitude"] doubleValue]];
    self.startLatitude  = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"startLatitude"] doubleValue]];
    self.startLongitude = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"startLongitude"] doubleValue]];
    self.endLatitude    = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"startLatitude"] doubleValue]];
    self.endLongitude   = [[NSNumber alloc] initWithDouble: [[shot valueForKey: @"startLongitude"] doubleValue]];
}

- (NSDictionary *) export;
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject: self.ID ? self.ID : [NSNull null] forKey: @"id"];
    [params setObject: self.holeID ? self.holeID : [NSNull null] forKey: @"holeID"];
    [params setObject: self.club ? self.club : [NSNull null] forKey: @"club"];
    [params setObject: self.shotNumber ? self.shotNumber : [NSNull null] forKey: @"shotNumber"];
    [params setObject: self.aimLatitude ? self.aimLatitude : [NSNull null] forKey: @"aimLatitude"];
    [params setObject: self.aimLongitude ? self.aimLongitude : [NSNull null] forKey: @"aimLongitude"];
    [params setObject: self.startLatitude ? self.startLatitude : [NSNull null] forKey: @"startLatitude"];
    [params setObject: self.startLongitude ? self.startLongitude : [NSNull null] forKey: @"startLongitude"];
    [params setObject: self.endLatitude ? self.endLatitude : [NSNull null] forKey: @"endLatitude"];
    [params setObject: self.endLongitude ? self.endLongitude : [NSNull null] forKey: @"endLongitude"];
    
    NSDictionary *shot = [[NSDictionary alloc] initWithObjectsAndKeys: params, @"shot" , nil];
    
    return shot;
}

@end
