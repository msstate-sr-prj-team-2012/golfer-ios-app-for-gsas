
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class RoundGetAll
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to properly retrieve rounds that supports pagination
 * of the API. When first instantiated, it retrieves the first
 * 10 rounds.
 *
 * USAGE
 *      For all rounds in the database.
 *          [[RoundGetAll alloc] init: nil];
 *      For all rounds in the database played by a certain user.
 *          [[RoundGetAll alloc] init: [NSNumber numberWithInt: userID]];
 */

#import <Foundation/Foundation.h>
#import "Round.h"
#import "Request.h"

@interface RoundGetAll : NSObject

/**
 * rounds - an array of round objects
 *
 * @security    public
 * @var         NSMutableArray
 */
@property (nonatomic, retain) NSMutableArray *rounds;

/**
 * nextPage - a private variable to keep up with what page to be called
 *
 * @security    private
 * @var         NSNumber
 */
@property (nonatomic)         NSNumber       *nextPage;

/**
 * userID - the ID of the user if getting all the round of a User
 *
 * @security    private
 * @var         NSNumber
 */
@property (nonatomic)         NSNumber       *userID;

/**
 * path - the path for the API
 *
 * @security    private
 * @var         NSString
 */
@property (nonatomic, copy)   NSString       *path;

/**
 * Constructor
 *
 * Can take on two views. Getting all the rounds in the database in general,
 * or getting all the rounds in the database in respect to a certain User 
 * with the newest Round first.
 *
 * @security    public
 *
 * @param       NSNumber|nil    data
 *
 * @return      RoundGetAll
 */
- (id) init: (NSNumber *) data;

/**
 * Retrieves the next page of Rounds.
 *
 * Retreives the next page of Rounds and appends the new Round objects
 * to the rounds variable.
 *
 * @security    public
 *
 * @return      void
 */
- (void) next;

@end
