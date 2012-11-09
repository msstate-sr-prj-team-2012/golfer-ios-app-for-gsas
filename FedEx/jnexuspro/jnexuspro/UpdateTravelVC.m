//
//  UpdateTravelVC.m
//  jnexuspro
//
//  Created by Apple on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UpdateTravelVC.h"
#import "UtilityClass.h"
#import "AppDelegate.h"
#import "NexusModel.h"

@interface UpdateTravelVC ()

@end

@implementation UpdateTravelVC

@synthesize travelMiles = _travelMiles;
@synthesize returnMiles = _returnMiles;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Travel";
        self.tabBarItem.image = [UIImage imageNamed:@"travel.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *sars = [delegate.userInfo objectForKey:@"sars"];
    NSMutableDictionary *sar = [sars objectForKey:[delegate.userInfo valueForKey:@"currentSar"]];
    self.travelMiles.text = [sar valueForKey:TRAVEL_MILES];
    self.returnMiles.text = [sar valueForKey:RETURN_MILES];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
