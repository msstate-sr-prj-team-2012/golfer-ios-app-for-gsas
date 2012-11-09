//
//  AppDelegate.h
//  jnexuspro
//
//  Created by C S on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginVC;
@class SarDetailsVC;
@class SarContactVC;
@class NexusModel;
#import "UtilityClass.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LoginVC *viewController;
@property (strong, nonatomic) NSUserDefaults *userInfo;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *sarTabBarController;
@property (strong, nonatomic) UITabBarController *timeTravelTabBarController;

@property (strong, nonatomic) NexusModel *model;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;


@end
