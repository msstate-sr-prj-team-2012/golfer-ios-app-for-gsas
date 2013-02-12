
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class Hole
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent Hole.
 * Generally used in Rounds. Will not be instantiated directly.
 *
 * roundID and holeNumber are the only required fields to insert a hole.
 */

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"
#import "Shot.h"

@interface Hole : NSObject

// ublic attributes
@property (nonatomic)         NSNumber       *ID;
@property (nonatomic)         NSNumber       *roundID;
@property (nonatomic)         NSNumber       *distance;
@property (nonatomic)         NSNumber       *holeScore;
@property (nonatomic)         NSNumber       *holeNumber;
@property (nonatomic)         NSNumber       *FIR;
@property (nonatomic)         NSNumber       *GIR;
@property (nonatomic)         NSNumber       *putts;
@property (nonatomic)         NSNumber       *firstRefLat;
@property (nonatomic)         NSNumber       *firstRefLong;
@property (nonatomic)         NSNumber       *secondRefLat;
@property (nonatomic)         NSNumber       *secondRefLong;
@property (nonatomic)         NSNumber       *thirdRefLat;
@property (nonatomic)         NSNumber       *thirdRefLong;
@property (nonatomic)         NSNumber       *firstRefX;
@property (nonatomic)         NSNumber       *firstRefY;
@property (nonatomic)         NSNumber       *secondRefX;
@property (nonatomic)         NSNumber       *secondRefY;
@property (nonatomic)         NSNumber       *thirdRefX;
@property (nonatomic)         NSNumber       *thirdRefY;
@property (nonatomic, retain) NSMutableArray *shots;

// public methods
- (id) construct: (NSObject *) data;

// private methods
- (id) init;
- (id) init: (NSDictionary *) data;
- (void) fillVariables: (NSDictionary *) data;
- (NSDictionary *) export;

@end
