//
//  CloseTicketVC.m
//  jnexuspro
//
//  Created by Apple on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CloseTicketVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "SarListVC.h"

@interface CloseTicketVC ()

@end

NSMutableArray *resolutions;
NSMutableDictionary *codeDict;

@implementation CloseTicketVC
@synthesize codePicker = _codePicker;

@synthesize resolutionCodeTF = _resolutionCodeTF;

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
    self.title = @"Close Ticket";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleBordered target:self action:@selector(closeTicket)];
    self.navigationItem.rightBarButtonItem = button;
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(retrieveCodes) withObject:nil afterDelay:0.01];
}

- (void) retrieveCodes
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *sars = [delegate.userInfo objectForKey:@"sars"];
    NSMutableDictionary *sar = [sars objectForKey:[delegate.userInfo valueForKey:@"currentSar"]];
    NSString * problemType = [sar valueForKey:PROBLEM_TYPE];
    codeDict = [NexusModel getResolutionCodesForProblemType:problemType];
    if (codeDict == nil)
        NSLog(@"Failed to retrieve resolution codes");
    resolutions = [[[codeDict allKeys] sortedArrayUsingFunction:sortCodes context:NULL] mutableCopy];
    [self.codePicker reloadAllComponents];
    [UtilityClass hideActivityIndicator];
}

static int sortCodes(NSString *tech1, NSString *tech2, void *context)
{
    tech1 = [[codeDict objectForKey:tech1] valueForKey:RESOLUTION_DETAIL];
    tech2 = [[codeDict objectForKey:tech2] valueForKey:RESOLUTION_DETAIL];
    return [tech1 compare:tech2];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.resolutionCodeTF.text = [resolutions objectAtIndex:row];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {    
    return [resolutions count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSMutableDictionary *tech = [codeDict objectForKey:[resolutions objectAtIndex:row]];
    NSString *title = [tech valueForKey:RESOLUTION_DETAIL];
    return title;
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    return sectionWidth;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView){
        tView = [[UILabel alloc] init];
        tView.font = [UIFont boldSystemFontOfSize:15];
    }
    // Fill the label text here
    NSMutableDictionary *tech = [codeDict objectForKey:[resolutions objectAtIndex:row]];
    NSString *title = [tech valueForKey:RESOLUTION_DETAIL];
    tView.text = title;
    return tView;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) closeTicket
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doCloseTicket) withObject:nil afterDelay:0.01];
}

- (void) doCloseTicket
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSString *currentDate = [dateFormatter stringFromDate:[NSDate date]];
    NSString *sarNum = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *dict = [NexusModel closeSar:sarNum withDate:currentDate andResolution:self.resolutionCodeTF.text];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Close Ticket Failed");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Close Ticket Failed" message:@"Please make sure that time, travel, and inventory are updated for this SAR" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else {
        NSLog(@"Close Ticket Success");
        SarListVC *view = [[self.navigationController viewControllers] objectAtIndex:2];
        [view refresh];
        [delegate.navigationController popToViewController:view animated:YES];

    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

@end
