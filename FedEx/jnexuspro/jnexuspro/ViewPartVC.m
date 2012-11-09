//
//  ViewPartVC.m
//  jnexuspro
//
//  Created by Apple on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewPartVC.h"
#import "NexusModel.h"
#import "AppDelegate.h"
#import "RemovePartVC.h"

@interface ViewPartVC ()

@end

@implementation ViewPartVC

@synthesize serialNumTF = _serialNumTF;
@synthesize partNumTF = _partNumTF;
@synthesize meterNumTF = _meterNumTF;
@synthesize inventoryDateTF = _inventoryDateTF;
@synthesize airbillNumTF = _airbillNumTF;
@synthesize dmtNumTF = _dmtNumTF;
@synthesize descriptionTF = _descriptionTF;
@synthesize removePartButton = _removePartButton;

@synthesize infoTextView = _infoTextView;

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
    NSString *serial = [self.partInfo valueForKey:SERIAL_NUMBER];
    self.title = [NSString stringWithFormat:@"Serial #%@", serial];
    if (self.partInfo == nil)
        self.partInfo = [NexusModel getPartInfoForSerial:serial];
    //self.infoTextView.text = [self.partInfo JSONRepresentation];
    self.serialNumTF.text = [self.partInfo valueForKey:SERIAL_NUMBER];
    self.partNumTF.text = [self.partInfo valueForKey:PART_NUMBER];
    self.meterNumTF.text = [self.partInfo valueForKey:METER_NUMBER];
    self.inventoryDateTF.text = [self.partInfo valueForKey:INVENTORY_DATE];
    self.airbillNumTF.text = [self.partInfo valueForKey:AIRBILL_NUMBER];
    self.dmtNumTF.text = [self.partInfo valueForKey:DMT_NUMBER];
    self.descriptionTF.text = [self.partInfo valueForKey:PART_DESCRIPTION];

    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:[NSString stringWithFormat:@"#%@", serial] style:UIBarButtonItemStyleBordered target:self action:NULL];
    self.navigationItem.backBarButtonItem = back;
    
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

- (IBAction) addToVan
{
    RemovePartVC *view = [[RemovePartVC alloc] initWithNibName:@"RemovePartVC" bundle:nil];
    view.partInfo = self.partInfo;
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:view animated:YES];
}

- (IBAction) reportLostStolen
{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doReportLostStolen) withObject:nil afterDelay:0.01];
}

- (void) doReportLostStolen
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSArray *parts = [[NSArray alloc] initWithObjects:[self.partInfo valueForKey:SERIAL_NUMBER], nil];
    NSMutableDictionary *dict = [NexusModel addParts:parts ForMeter:LOST_STOLEN_METER];
    if (dict == nil)
        NSLog(@"Repost Lost Stolen Failed");
    else
        NSLog(@"Report Lost Stolen Success");
    [delegate.navigationController popViewControllerAnimated:YES];
}



@end
