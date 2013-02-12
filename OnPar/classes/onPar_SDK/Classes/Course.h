
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

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface Course : NSObject

/**
 * ID - the database ID of this Course if
 *      present in the database
 *
 * @security    public
 * @var         NSNumber
 */
@property (nonatomic)       NSNumber *ID;

/**
 * name - the name of the Course
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *name;

/**
 * location - the location of the Course
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *location;

/**
 * Constructor
 *
 * For public use, the constructor instantiates a Course object
 * by either passing nil or an NSNumber ID that represents the
 * database ID. If required, the information will be pulled from 
 * the API.
 *
 * @security    public
 *
 * @var         NSNumber|nil    data
 *
 * @return      Course
 */
- (id) construct: (NSObject *) data;

/**
 * Saves a Course to the database.
 *
 * If there is an ID already present, update the Course in the database
 * through the API. If there is no ID, insert the Course in to the
 * database through the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) save;

/**
 * Deletes a Course in the database.
 *
 * Deletes the Course in the database throught the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) del;

/**
 * Gets all Courses.
 *
 * Retreives all courses in the database through the API and
 * creates an array of Course objects.
 * 
 * @security    public
 *
 * @return      NSArray
 */
+ (NSArray *) getAll;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (void) fillVariables: (NSDictionary *) data;
- (NSDictionary *) export;

@end
