
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class Round
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent Round.
 * Can represent a Round already in the database through the API or
 * can represent a Round not in the database that can be saved to the
 * database.
 *
 * USAGE
 *      For a round not in the database.
 *          Round *round = [[Round alloc] construct: nil];
 *      For a round already in the database.
 *          Round *round = [[Round alloc] construct: [NSNumber numberWithInt: roundID]];
 */

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "SBJson.h"
#import "Request.h"
#import "Shot.h"
#import "Hole.h"
#import "User.h"
#import "Course.h"

@interface Round : NSObject

/**
 * ID - the database ID of the object
 *
 * @security    public
 * @var         NSNumber
 */
@property (nonatomic)         NSNumber       *ID;

/**
 * user - the user playing this round
 *
 * @security    public
 * @var         User
 */
@property (nonatomic, retain) User           *user;

/**
 * course - the course this round is being played on
 *
 * @security    public
 * @var         Course
 */
@property (nonatomic, retain) Course         *course;

/**
 * totalScore - represents the round score (optional)
 *
 * @security    public
 * @var         NSNumber
 */
@property (nonatomic)         NSNumber       *totalScore;

/**
 * teeID - the numerical representation of which tee is used
 *
 * @security    public
 * @var         NSNumber
 */
@property (nonatomic)         NSNumber       *teeID;

/**
 * startTime - a string representation of the timestamp
 *
 * @security    public
 * @var         NSString
 */
@property (nonatomic, copy)   NSString       *startTime;

/**
 * holes - an array of the holes in the round
 *
 * @security    public
 * @var         NSMutableArray
 */
@property (nonatomic, retain) NSMutableArray *holes;

/**
 * Constructor
 *
 * For public use, the constructor instantiates a Round object
 * by either passing nil or an NSNumber ID that represents the
 * database ID. If required, the information will be pulled from
 * the API.
 *
 * @security    public
 *
 * @var         NSNumber|nil    data
 *
 * @return      Round
 */
- (id) construct: (NSObject *) data;

/**
 * Saves a Round to the database.
 *
 * If there is an ID already present, update the Round in the database
 * through the API. If there is no ID, insert the Round in to the
 * database through the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) save;

/**
 * Deletes a Round in the database.
 *
 * Deletes the Round in the database throught the API.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) del;

/**
 * Creates a skeleton Round object.
 *
 * When a new Round is started, this will return a skeleton round with every hole
 * with static information so it is easy to fill in.
 *
 * @security    public
 * 
 * @param       User        u
 * @param       Course      c
 * @param       NSNumber    t
 *
 * @return      Round
 */
+ (Round *) startNowWithUser: (User *) u onCourse: (Course *) c fromTee: (NSNumber *) t;

// private methods
- (id) init;
- (id) init: (NSObject *) data;
- (NSDictionary *) export;
- (void) fillVariables: (NSDictionary *) data;

@end
