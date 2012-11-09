//
//  CreateTicketVC.m
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreateTicketVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "AppDelegate.h"

@interface CreateTicketVC ()

@end

@implementation CreateTicketVC
@synthesize scrollView = _scrollView;
@synthesize meterNumTF = _meterNumTF;
@synthesize systemTypeTF = _systemTypeTF;
@synthesize problemCodeTF = _problemCodeTF;
@synthesize problemTypePicker = _problemTypePicker;
@synthesize componentTypeTF = _componentTypeTF;
@synthesize notesTV = _notesTV;
@synthesize priorityStatusSC = _priorityStatusSC;

NSMutableDictionary *problemDict;
NSMutableArray *problemArray;
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
    self.title = @"Create Ticket";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStyleBordered target:self action:@selector(createTicket)];
    self.navigationItem.rightBarButtonItem = button;
    self.scrollView.bouncesZoom = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *2.70);
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard:)];
    gestureRecognizer.delegate = self;
    [self.scrollView addGestureRecognizer:gestureRecognizer];
}

- (void) createTicket
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doCreateTicket) withObject:nil afterDelay:0.01];
}

- (void) doCreateTicket
{
    NSMutableDictionary *info = [[NSMutableDictionary alloc] init];
    [info setObject:self.meterNumTF.text forKey:METER_NUMBER];
    [info setObject:self.systemTypeTF.text forKey:SYSTEM_TYPE];
    [info setObject:self.componentTypeTF.text forKey:COMPONENT_TYPE];
    [info setObject:[NSString stringWithFormat:@"%d", (self.priorityStatusSC.selectedSegmentIndex+1)] forKey:PRIORITY_STATUS];
    [info setObject:self.notesTV.text forKey:NOTES];
    [info setObject:self.problemCodeTF.text forKey:PROBLEM_TYPE];
    [info setObject:[NSString stringWithFormat:@"%@", [NSDate date]] forKey:EXPIRATION_DATE];
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSMutableDictionary *dict = [NexusModel createTicket:info ForEmployee:[delegate.userInfo valueForKey:@"employeeID"]];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Create Ticket Failed");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Create Ticket Failed" message:@"Please insert a valid meter number and problem code." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else 
    {
        NSLog(@"Create Ticket success");
        [delegate.navigationController popViewControllerAnimated:YES];
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void) viewWillAppear:(BOOL)animated
{
    //AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    /*NSMutableDictionary *sars = [delegate.userInfo objectForKey:@"sars"];
    NSMutableDictionary *sar = [sars objectForKey:[delegate.userInfo valueForKey:@"currentSar"]];
    NSString * problemType = [sar valueForKey:PROBLEM_TYPE];*/
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(getProblemCodes) withObject:nil afterDelay:0.01];
}

- (void) getProblemCodes    
{
    problemDict = [NexusModel getProblemCodeList];
    if (problemDict == nil)
        NSLog(@"Failed to retrieve problem codes");
    problemArray = [[[problemDict allKeys] sortedArrayUsingFunction:sortCodes context:NULL] mutableCopy];
    [self.problemTypePicker reloadAllComponents];
    [UtilityClass hideActivityIndicator];
}

static int sortCodes(NSString *tech1, NSString *tech2, void *context)
{
    tech1 = [[problemDict objectForKey:tech1] valueForKey:RESOLUTION_DETAIL];
    tech2 = [[problemDict objectForKey:tech2] valueForKey:RESOLUTION_DETAIL];
    return [tech1 compare:tech2];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.problemCodeTF.text = [problemArray objectAtIndex:row];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {    
    return [problemArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
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
    NSMutableDictionary *tech = [problemDict objectForKey:[problemArray objectAtIndex:row]];
    NSString *title = [tech valueForKey:PROBLEM_DETAIL];
    tView.text = title;
    return tView;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

-(void) hideKeyBoard:(id) sender
{
    [UtilityClass dismissKeyboard];
}

@end
