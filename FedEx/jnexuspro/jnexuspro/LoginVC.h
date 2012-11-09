//
//  LoginVC.h
//  jnexuspro
//
//  Created by C S on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LoginVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *employeeIDTextField;
@property (strong, nonatomic) IBOutlet UITextField *nexusPWDTextField;
@property (strong, nonatomic) AppDelegate *appDelegate;

- (IBAction)login:(id)sender;
@end
