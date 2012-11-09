//
//  UpdateAddressVC.m
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UpdateAddressVC.h"
#import "AppDelegate.h"
#import "NexusModel.h"
#import "UtilityClass.h"

@interface UpdateAddressVC ()

@end

@implementation UpdateAddressVC
@synthesize addressLine1TF = _addressLine1TF;
@synthesize addressLine2TF = _addressLine2TF;
@synthesize cityTF = _cityTF;
@synthesize stateTF = _stateTF;
@synthesize zipTF = _zipTF;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Address";
        self.tabBarItem.image = [UIImage imageNamed:@"travel.png"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *sarInfo = [[delegate.userInfo objectForKey:@"sars"] objectForKey:currentSar];
    self.addressLine1TF.text = [sarInfo valueForKey:ADDRESS_LINE1];
    self.addressLine2TF.text = [sarInfo valueForKey:ADDRESS_LINE2];
    self.cityTF.text = [sarInfo valueForKey:CITY];
    self.stateTF.text = [sarInfo valueForKey:STATE];
    self.zipTF.text = [sarInfo valueForKey:ZIP];
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
