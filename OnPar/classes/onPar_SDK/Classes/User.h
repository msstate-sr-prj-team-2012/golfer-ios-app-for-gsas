
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class User
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent User.
 * Can represent a User already in the database through the API or
 * can represent a User not in the database that can be saved to the
 * database.
 *
 * USAGE
 *      For a user not in the database.
 *          User *user = [[User alloc] construct: nil];
 *      For a user already in the database.
 *          User *user = [[User alloc] construct: [NSNumber numberWithInt: userID]];
 *      OR
 *          User *user = [[User alloc] construct: @"email"];
 *      OR
 *          User *user = [[User alloc] construct: @"memberID"];
 */

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"

@interface User : NSObject

/**
 * ID - the database ID of the user
 *
 * @security    public
 * @var         NSNumber
 */
@property (nonatomic)       NSNumber *ID;

/**
 * memberID - the member ID of the User. Can be null. Unique.
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *memberID;

/**
 * nickname - a User chosen nickname to show while playing. Can be null.
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *nickname;

/**
 * name - the name of the User. Format: Last, First
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *name;

/**
 * email - the email of the User. Unique.
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy) NSString *email;

/**
 * Constructor
 *
 * For public use, the constructor instantiates a User object
 * by either passing nil, NSNumber ID, or NSString email or memberID. 
 * If required, the information will be pulled from
 * the API.
 *
 * @security    public
 *
 * @var         NSNumber|NSString|nil    data
 *
 * @return      User
 */
- (id) construct: (NSObject *) data;

/**
 * Saves a User to the database.
 *
 * If there is an ID already present, update the User in the database
 * through the API. If there is no ID, insert the User in to the
 * database through the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) save;

/**
 * Deletes a User in the database.
 *
 * Deletes the User in the database throught the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) del;

/**
 * Gets all Users.
 *
 * Retreives all users in the database through the API and
 * creates an array of User objects.
 *
 * @security    public
 *
 * @return      NSArray
 */
+ (NSArray *) getAll;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (NSDictionary *) export;
- (void) fillVariables: (NSDictionary *) data;

@end
