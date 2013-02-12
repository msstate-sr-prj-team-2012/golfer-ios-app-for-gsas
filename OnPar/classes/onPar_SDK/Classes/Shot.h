
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

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface Shot : NSObject

// private attributes
@property (nonatomic) NSNumber *ID;
@property (nonatomic) NSNumber *holeID;
@property (nonatomic) NSNumber *club;
@property (nonatomic) NSNumber *shotNumber;
@property (nonatomic) NSNumber *aimLatitude;
@property (nonatomic) NSNumber *aimLongitude;
@property (nonatomic) NSNumber *startLatitude;
@property (nonatomic) NSNumber *startLongitude;
@property (nonatomic) NSNumber *endLatitude;
@property (nonatomic) NSNumber *endLongitude;

// public methods
- (id) construct: (NSObject *) data;

// private methods
- (id) init;
- (id) init: (NSDictionary *) data;
- (void) fillVariables: (NSDictionary *) data;
- (NSDictionary *) export;

@end
