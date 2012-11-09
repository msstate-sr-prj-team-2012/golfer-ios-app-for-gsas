//
//  UtilityClass.h
//  jnexuspro
//
//  Created by C S on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityClass : NSObject

+ (void) dismissKeyboard;
+ (void) globalResignFirstResponder;
+ (void) globalResignFirstResponderRec:(UIView *) view;
+ (void) cacheData;
+ (void) showActivityIndicator;
+ (void) hideActivityIndicator;
@end
