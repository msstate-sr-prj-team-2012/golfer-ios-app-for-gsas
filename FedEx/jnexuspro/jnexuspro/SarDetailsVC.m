//
//  SarDetailsVC.m
//  jnexuspro
//
//  Created by C S on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SarDetailsVC.h"
#import "SBJson.h"
#import "NexusModel.h"

@interface SarDetailsVC ()

@end

@implementation SarDetailsVC

@synthesize sarInfo = _sarInfo;
@synthesize sarNum = _sarNum;
@synthesize detailsTextView;
@synthesize problemTypeLabel = _problemTypeLabel;
@synthesize priorityStatusLabel = _priorityStatusLabel;
@synthesize problemDetailLabel = _problemDetailLabel;
@synthesize systemTypeLabel = _systemTypeLabel;
@synthesize componentTypeLabel = _componentTypeLabel;
@synthesize expirationLabel = _expirationLabel;
@synthesize resolutionDetailLabel = _resolutionDetailLabel;
@synthesize sarStatusLabel = _sarStatusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Details";
        self.tabBarItem.image = [UIImage imageNamed:@"details.png"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*self.sarStatusLabel.text = [NSString stringWithFormat:@"SAR Status: \"%@\"", [self.sarInfo valueForKey:SAR_STATUS]];
    self.problemDetailLabel.text = [NSString stringWithFormat:@"Problem Detail: \"%@\"",[self.sarInfo valueForKey:PROBLEM_DETAIL]];
    self.problemTypeLabel.text = [NSString stringWithFormat:@"Problem Type: \"%@\"",[self.sarInfo valueForKey:PROBLEM_TYPE]];
    self.priorityStatusLabel.text = [NSString stringWithFormat:@"Priority Status: \"%@\"",[self.sarInfo valueForKey:PRIORITY_STATUS]];
    self.resolutionDetailLabel.text = [NSString stringWithFormat:@"Resolution Detail: \"%@\"",[self.sarInfo valueForKey:RESOLUTION_DETAIL]];
    self.expirationLabel.text = [NSString stringWithFormat:@"Expiration Date: \"%@\"",[self.sarInfo valueForKey:EXPIRATION_DATE]];
    self.systemTypeLabel.text = [NSString stringWithFormat:@"System Type: \"%@\"",[self.sarInfo valueForKey:SYSTEM_TYPE]];
    self.componentTypeLabel.text = [NSString stringWithFormat:@"Component Type: \"%@\"",[self.sarInfo valueForKey:COMPONENT_TYPE]];*/
    
    NSArray *pstatus = [[NSArray alloc] initWithObjects:@"", @"CRITICAL", @"HIGH", @"NORMAL", @"LOW", nil];
    NSArray *pcolors = [[NSArray alloc] initWithObjects:[UIColor blackColor], [UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], nil];
    self.sarStatusLabel.text = [self.sarInfo valueForKey:SAR_STATUS];
    self.problemDetailLabel.text = [self.sarInfo valueForKey:PROBLEM_DETAIL];
    self.problemTypeLabel.text = [self.sarInfo valueForKey:PROBLEM_TYPE];
    self.priorityStatusLabel.text = [pstatus objectAtIndex:[[self.sarInfo valueForKey:PRIORITY_STATUS] intValue]];
    self.priorityStatusLabel.textColor = [pcolors objectAtIndex:[[self.sarInfo valueForKey:PRIORITY_STATUS] intValue]];
    self.priorityStatusLabel.font = [UIFont boldSystemFontOfSize:18];
    self.resolutionDetailLabel.text = [self.sarInfo valueForKey:RESOLUTION_DETAIL];
    self.expirationLabel.text = [self.sarInfo valueForKey:EXPIRATION_DATE];
    self.systemTypeLabel.text = [self.sarInfo valueForKey:SYSTEM_TYPE];
    self.componentTypeLabel.text = [self.sarInfo valueForKey:COMPONENT_TYPE];
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

- (void) start
{

}

@end
