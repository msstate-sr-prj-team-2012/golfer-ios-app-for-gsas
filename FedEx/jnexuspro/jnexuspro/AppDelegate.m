//
//  AppDelegate.m
//  jnexuspro
//
//  Created by C S on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "LoginVC.h"
#import "SarDetailsVC.h"
#import "SarContactVC.h"
#import "SarNotesVC.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize userInfo = _userInfo;
@synthesize navigationController = _navigationController;
@synthesize model = _model;
@synthesize sarTabBarController = _sarTabBarController;
@synthesize timeTravelTabBarController = _timeTravelTabBarController;
@synthesize activityIndicator = _activityIndicator;

- (id) init
{
    if (self = [super init])
    {
        NSMutableDictionary *initialDefaults = [[NSMutableDictionary alloc] init];
        [initialDefaults setObject:@"" forKey:@"employeeID"];
        [initialDefaults setObject:[[NSDictionary alloc] init] forKey:@"employeeInfo"];
        [initialDefaults setObject:@"" forKey:@"currentSar"];
        
        NSMutableDictionary *sars = [[NSMutableDictionary alloc] init];
        [initialDefaults setObject:sars forKey:@"sars"];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults registerDefaults:initialDefaults];
        
        self.userInfo = defaults;
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];    
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator.center = self.window.center;
    self.activityIndicator.color = [UIColor blackColor];
    
    
    self.activityIndicator.hidesWhenStopped = YES;
    
    
    
    // Base Navigation Controller
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.navigationController.navigationBar.tintColor =[UIColor colorWithRed:(7./16.) green:0.0 blue:(13./16.) alpha:1];
    self.window.rootViewController = self.navigationController;
    
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
