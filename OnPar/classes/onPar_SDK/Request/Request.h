
/**
 * OnPar - Fall 2012 software engineering senior design project at Mississippi
 *         State University.
 *
 * @author  Fall 2012 Senior Design Team
 * @version 1.0
 * @package OnPar
 */

/**
 * Class Request
 * @package iOS
 * @author  Kevin Benton
 * @version 1.0
 *
 * Class to represent a request to the API. 
 * Takes the URI path and request body to create.
 *
 * USAGE
 *
 * For GET request
 * Request *request = [[Request alloc] init: path body: nil];
 *
 * For POST request
 * Request *request = [[Request alloc] init: path body: body];
 */

#import <Foundation/Foundation.h>
#import "LRResty.h"
#import "defines.h"
#import "Reachability.h"
#import "SBJson.h"

@interface Request : NSObject

/**
 * path - the URI path of the request
 *
 * @var         NSString
 * @security    public
 */
@property (nonatomic, copy)   NSString        *path;

/**
 * url - string reqpresentation of the whole API URL with
 *       the appended path
 *
 * @var         NSString
 * @security    private
 */
@property (nonatomic, copy)   NSString        *url;

/**
 * method - the request method of this request
 *          (GET, POST)
 *
 * @var         NSString
 * @security    private
 */
@property (nonatomic, copy)   NSString        *method;

/**
 * requestBody - the body to be sent with the request.
 *               Can be nil.
 *
 * @var         NSDictionary
 * @security    public
 */
@property (nonatomic, copy)   NSDictionary    *requestBody;

/**
 * requestHeaders - Headers that are sent with the request.
 *
 * @var         NSDictionary
 * @security    private
 */
@property (nonatomic, copy)   NSDictionary    *requestHeaders;

/**
 * response - the returned response of the request
 *
 * @var         LRRestyResponse
 * @security    public
 */
@property (nonatomic, retain) LRRestyResponse *response;

/**
 * reach - a way to tell if the API is reachable.
 *
 * @var         Reachability
 * @security    public
 */
@property (nonatomic, retain) Reachability    *reach;

/**
 * Constructor
 *
 * Instantiates a request. Path is a required argument. Body is optional.
 * If no body is passed in (aka nil), it will construct a GET request. Otherwise,
 * it constructs a POST request.
 *
 * @security    public
 *
 * @param       NSString        resourcePath
 * @param       NSDictionary    body
 *
 * @return      Request
 */
- (id) init: (NSString *) resourcePath body: (NSDictionary *) body;

/**
 * Executes a request
 *
 * After checking to see if the API is reachable, based on what method is being
 * used for this request, it returns the boolean value of the proper function.
 *
 * @security    public
 *
 * @return      BOOL
 */
- (BOOL) execute;

/**
 * Executes a GET request
 *
 * Executes the GET request. Catches server errors (range 5xx).
 *
 * @security    private
 *
 * @return      BOOL
 */
- (BOOL) executeGet;

/**
 * Executes a POST request
 *
 * Executes the POST request. Catches server errors (range 5xx).
 *
 * @security    private
 *
 * @return      BOOL
 */
- (BOOL) executePost;

@end
