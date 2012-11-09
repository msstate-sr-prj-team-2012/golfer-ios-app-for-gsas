//
//  SarTimeVC.m
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SarTimeVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "AppDelegate.h"

@interface SarTimeVC ()

@end

@implementation SarTimeVC

@synthesize travelStartTime = _travelStartTime;
@synthesize returnTime = _returnTime;
@synthesize jobEndTime = _jobEndTime;
@synthesize jobStartTime = _jobStartTime;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Time";
        self.tabBarItem.image = [UIImage imageNamed:@"clock.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *sars = [delegate.userInfo objectForKey:@"sars"];
    NSMutableDictionary *sar = [sars objectForKey:[delegate.userInfo valueForKey:@"currentSar"]];
    self.travelStartTime.text = [sar valueForKey:START_TRAVEL_TIME];
    self.returnTime.text = [sar valueForKey:RETURN_TIME];
    self.jobEndTime.text = [sar valueForKey:DEPART_TIME];
    self.jobStartTime.text = [sar valueForKey:ARRIVE_TIME];
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

- (NSString *) currentTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH:mm";
    return [dateFormatter stringFromDate:[NSDate date]];
}

- (IBAction) setJobEndTimeField:(id)sender
{
    self.jobEndTime.text = [self currentTime];
}

- (IBAction) setJobStartTimeField:(id)sender
{
    self.jobStartTime.text = [self currentTime];
}

- (IBAction) setReturnTimeField:(id)sender
{
    self.returnTime.text = [self currentTime];
}

- (IBAction) setTravelStartTimeField:(id)sender
{
    self.travelStartTime.text = [self currentTime];
}

@end
