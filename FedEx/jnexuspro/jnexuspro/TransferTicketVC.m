//
//  TransferTicketVC.m
//  jnexuspro
//
//  Created by Apple on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TransferTicketVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "SarListVC.h"

@interface TransferTicketVC ()

@end

@implementation TransferTicketVC

@synthesize techPicker = _techPicker;

@synthesize transferTechIdTF = _transferTechIdTF;
@synthesize techDictionary = _techDictionary;

NSMutableArray *techArray;
NSMutableDictionary *techDict;

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
    self.title = @"Transfer";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Transfer" style:UIBarButtonItemStyleBordered target:self action:@selector(transfer)];
    self.navigationItem.rightBarButtonItem = button;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(retrieveTechs) withObject:nil afterDelay:0.01];
}

- (void) retrieveTechs
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    self.techDictionary = [NexusModel getTransferrableTechsForTech:[delegate.userInfo valueForKey:@"employeeID"]];
    techDict = [self.techDictionary mutableCopy];
    if (self.techDictionary == nil)
        NSLog(@"Failed to retrieve transferrable techs");
    techArray = [[[techDict allKeys] sortedArrayUsingFunction:sortTechs context:NULL] mutableCopy];
    [self.techPicker reloadAllComponents];
    [UtilityClass hideActivityIndicator];
}

static int sortTechs(NSString *tech1, NSString *tech2, void *context)
{
    tech1 = [[techDict objectForKey:tech1] valueForKey:EMPLOYEE_NAME];
    tech2 = [[techDict objectForKey:tech2] valueForKey:EMPLOYEE_NAME];
    return [tech1 compare:tech2];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.transferTechIdTF.text = [techArray objectAtIndex:row];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {    
    return [techArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSMutableDictionary *tech = [self.techDictionary objectForKey:[techArray objectAtIndex:row]];
    NSString *title = [tech valueForKey:EMPLOYEE_NAME];
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
    NSMutableDictionary *tech = [self.techDictionary objectForKey:[techArray objectAtIndex:row]];
    NSString *title = [tech valueForKey:EMPLOYEE_NAME];
    tView.text = title;
    return tView;
}

- (void) transfer
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doTransfer) withObject:nil afterDelay:0.01];
}

- (void) doTransfer
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *dict = [NexusModel transferSar:currentSar toTech:self.transferTechIdTF.text];
    [UtilityClass hideActivityIndicator];
    if (dict == nil){
        NSLog(@"Transfer Ticket Failed");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Transfer Failed" message:@"Check Employee ID enter or network connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        NSLog(@"Transfer Ticket Succeeded");
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
