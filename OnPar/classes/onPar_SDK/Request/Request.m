
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

#import "Request.h"

@implementation Request

@synthesize path;
@synthesize url;
@synthesize method;
@synthesize requestBody;
@synthesize requestHeaders;
@synthesize response;
@synthesize reach;

- (id) init: (NSString *) resourcePath body: (NSDictionary *) body;
{
    if (self = [super init]) {
        self.path = resourcePath;
        self.response = nil;
        
        if (body) {
            self.method = @"POST";
            self.requestBody = body;
        } else {
            self.method = @"GET";
            self.requestBody = nil;
        }
        
        self.reach = [Reachability reachabilityWithHostname: BASE_URL];
        
        self.requestHeaders = [NSDictionary dictionaryWithObject: @"application/json"
                                                          forKey: @"Content-Type"
                               ];
        self.url = [NSString stringWithFormat: @"%@%@", BASE_URL, [self path]];
    }
    
    return self;
}

- (BOOL) execute;
{
    if ([self.reach currentReachabilityString] == @"WiFi") {
        NSLog(@"Executing %@ request to %@", self.method, self.url);
        if (self.method == @"GET") {
            return [self executeGet];
        } else {
            return [self executePost];
        }
    } else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Connection Error"
                                                          message:@"You must be connect to the Wi-Fi at the club house for this action."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
        
        return NO;
    }
}

- (BOOL) executeGet;
{
    // block on the main thread
    // this implements a synchronous request
    __block int status = -1;
        
    [[LRResty authenticatedClientWithUsername: API_USERNAME
                                     password: API_PASSWORD
        ]
        get: self.url
        parameters: nil
        headers: self.requestHeaders
        withBlock: ^(LRRestyResponse *r) {
            self.response = r;
            status = r.status;
        }
    ];
        
    while (status == -1) [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
        
    if (self.response.status >= 500) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Server Error"
                                                          message:@"The server is experiencing problems. Please try again later."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
            
        return NO;
    } else {
        return YES;
    }
}

-(BOOL) executePost;
{
    // block on the main thread
    // this implements a synchronous request
    __block int status = -1;
    
    [[LRResty authenticatedClientWithUsername: API_USERNAME
                                     password: API_PASSWORD
        ]
        post: self.url
        payload: [[SBJsonWriter alloc] stringWithObject: self.requestBody]
        headers: self.requestHeaders
        withBlock: ^(LRRestyResponse *r) {
            self.response = r;
            status = r.status;
        }
    ];
    
    while (status == -1) [[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
    
    if (self.response.status >= 500) {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Server Error"
                                                          message:@"The server is experiencing problems. Please try again later."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
            
        return NO;
    } else {
        return YES;
    }
}

@end
