//
//  RemovePartVC.m
//  jnexuspro
//
//  Created by Apple on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RemovePartVC.h"
#import "AppDelegate.h"
#import "NexusModel.h"

@interface RemovePartVC ()

@end

@implementation RemovePartVC

@synthesize airbillNumber = _airbillNumber;
@synthesize dmtNumber = _dmtNumber;
@synthesize partInfo = _partInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Remove";
    UIBarButtonItem *remove = [[UIBarButtonItem alloc] initWithTitle:@"Remove" style:UIBarButtonItemStyleBordered target:self action:@selector(removePart)];
    self.navigationItem.rightBarButtonItem = remove;
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

- (IBAction) removePart
{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doRemovePart) withObject:nil afterDelay:0.01];
}

- (void) doRemovePart
{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSString *vanMeterNum = [[delegate.userInfo objectForKey:@"employeeInfo"]valueForKey:EMPLOYEE_VANMETERNUM];
    NSArray *parts = [[NSArray alloc] initWithObjects:[self.partInfo valueForKey:SERIAL_NUMBER], nil];
    NSMutableDictionary *dict = [NexusModel addParts:parts ForMeter:vanMeterNum];
    if (dict == nil)
    {
        NSLog(@"Remove Part Failed");
        // Alert fail
        return;
    }
    else
    {
        NSLog(@"Added part to van inventory");
    }
    if (self.dmtNumber.text != @"")
    {
        NSLog(@"Saving DMT and Airbill #");
        dict = [NexusModel saveDMT:self.dmtNumber.text AndAirbill:self.airbillNumber.text ForSerial:[self.partInfo valueForKey:SERIAL_NUMBER]];
        if (dict == nil)
        {
            NSLog(@"Saving DMT and Airbill: failure");
        }
        else
        {
            NSLog(@"Saving DMT and Airbill: success");
        }
    }
    else 
    {
        NSLog(@"No DMT and Airbill #");
    }
    [UtilityClass hideActivityIndicator];
    int currentIndex = [delegate.navigationController.viewControllers count] - 3;
    [delegate.navigationController popToViewController:[delegate.navigationController.viewControllers objectAtIndex:currentIndex] animated:YES];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

@end
