//
//  UpdateContactVC.m
//  jnexuspro
//
//  Created by Apple on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UpdateContactVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "AppDelegate.h"

@interface UpdateContactVC ()

@end

@implementation UpdateContactVC

@synthesize businessNameTF = _businessNameTF;
@synthesize contactNameTF = _contactNameTF;
@synthesize contactNumberTF = _contactNumberTF;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Information";
        self.tabBarItem.image = [UIImage imageNamed:@"contact.png"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *sarInfo = [[delegate.userInfo objectForKey:@"sars"] objectForKey:currentSar];
    self.businessNameTF.text = [sarInfo valueForKey:BUSINESS_NAME];
    self.contactNameTF.text = [sarInfo valueForKey:CONTACT_NAME];
    self.contactNumberTF.text = [sarInfo valueForKey:CONTACT_NUMBER];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

@end
