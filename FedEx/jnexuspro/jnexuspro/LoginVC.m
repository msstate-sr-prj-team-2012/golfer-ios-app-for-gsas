//
//  ViewController.m
//  jnexuspro
//
//  Created by C S on 7/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginVC.h"
#import "HomeVC.h"
#import "NexusModel.h"
#import "UtilityClass.h"

@interface LoginVC ()

@end

@implementation LoginVC

@synthesize employeeIDTextField = _employeeIDTextField;
@synthesize nexusPWDTextField = _nexusPWDTextField;
@synthesize appDelegate = _appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Login";
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonSystemItemCancel target:self action:nil];
    self.navigationItem.backBarButtonItem = logoutButton;
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.employeeIDTextField.text = [self.appDelegate.userInfo stringForKey:@"employeeID"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    delegate.activityIndicator.center = self.view.center;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)login:(id) sender
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doLogin) withObject:nil afterDelay:0.01];
}

- (void) doLogin
{
    // Check Login Credentials
    NSString *uid = self.employeeIDTextField.text;
    NSString *password = self.nexusPWDTextField.text;
    NSDictionary *employeeInfo = [NexusModel verifyLoginForID:uid Password:password];
    [UtilityClass hideActivityIndicator];

    // Login Successful
    if (employeeInfo != nil)
    {
        // Cache default user information
        NSLog(@"Login Success");
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:employeeInfo forKey:@"employeeInfo"];
        [defaults setObject:uid forKey:@"employeeID"];
        [defaults setObject:password forKey:@"employeePW"];
        [defaults synchronize];
        
        // Load Sar List View
        HomeVC *viewController = [[HomeVC alloc] initWithNibName:@"HomeVC" bundle:nil];
        [self.appDelegate.navigationController pushViewController:viewController animated:YES];
    }
    // Login Failed
    else
    {
        NSString *cachedID = [self.appDelegate.userInfo valueForKey:@"employeeID"];
        NSString *cachedPW = [self.appDelegate.userInfo valueForKey:@"employeePW"];
        if (uid == cachedID && password == cachedPW)
        {
            NSLog(@"Cached Login");
            // Load Sar List View
            HomeVC *viewController = [[HomeVC alloc] initWithNibName:@"HomeVC" bundle:nil];
            [self.appDelegate.navigationController pushViewController:viewController animated:YES];
        }
        else 
        {
            NSLog(@"Login Failed");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed" message:@"Please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];

        }
    }
}

// Dismisses keyboard when touch outside textfield
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [UtilityClass dismissKeyboard];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [UtilityClass cacheData];
}

@end
