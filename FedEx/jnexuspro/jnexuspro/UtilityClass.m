//
//  UtilityClass.m
//  jnexuspro
//
//  Created by C S on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UtilityClass.h"
#import "AppDelegate.h"

@implementation UtilityClass

+ (void) dismissKeyboard
{
    [self globalResignFirstResponder];
}

+ (void) globalResignFirstResponder
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    for (UIView *view in [window subviews])
    {
        [self globalResignFirstResponderRec:view];
    }
}

+ (void) globalResignFirstResponderRec:(UIView *) view
{
    if ([view respondsToSelector:@selector(resignFirstResponder)])
        [view resignFirstResponder];
    for (UIView *subview in [view subviews])
        [self globalResignFirstResponderRec:subview];
}

+ (void) cacheData
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.userInfo synchronize];
}

+ (void) showActivityIndicator
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.activityIndicator startAnimating];
}

+ (void) hideActivityIndicator
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.activityIndicator stopAnimating];
}
         
@end
