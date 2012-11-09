//
//  UpdateInterruptVC.m
//  jnexuspro
//
//  Created by Apple on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UpdateInterruptVC.h"
#import "UtilityClass.h"
#import "AppDelegate.h"
#import "NexusModel.h"

@interface UpdateInterruptVC ()

@end

@implementation UpdateInterruptVC
@synthesize jobInterruptMinutes = _jobInterruptMinutes;
@synthesize travelInterruptMinutes = _travelInterruptMinutes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Interrupt";
        self.tabBarItem.image = [UIImage imageNamed:@"interrupt.png"];
   }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *sars = [delegate.userInfo objectForKey:@"sars"];
    NSMutableDictionary *sar = [sars objectForKey:[delegate.userInfo valueForKey:@"currentSar"]];
    self.jobInterruptMinutes.text = [sar valueForKey:INTERUPT_JOB_TIME];
    self.travelInterruptMinutes.text = [sar valueForKey:INTERRUPT_TRAVEL_TIME];
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
