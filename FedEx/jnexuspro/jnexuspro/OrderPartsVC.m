//
//  OrderPartsVC.m
//  jnexuspro
//
//  Created by Apple on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OrderPartsVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "AppDelegate.h"

@interface OrderPartsVC ()

@end

@implementation OrderPartsVC

@synthesize partNumberTF = _partNumberTF;
@synthesize quantityTF = _quantityTF;
@synthesize partPicker = _partPicker;

NSMutableDictionary *partsDict;
NSMutableArray *partsArray;

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
    self.title = @"Order Parts";
    UIBarButtonItem *order = [[UIBarButtonItem alloc] initWithTitle:@"Order" style:UIBarButtonItemStyleBordered target:self action:@selector(order)];
    self.navigationItem.rightBarButtonItem = order;
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

- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(retrievePartsList) withObject:nil afterDelay:0.01];
}

- (void) retrievePartsList
{
    partsDict = [NexusModel getPartsList];
    if (partsDict == nil)
        NSLog(@"Failed to retrieve orderable parts list");
    partsArray = [[[partsDict allKeys] sortedArrayUsingFunction:sortParts context:NULL] mutableCopy];
    [self.partPicker reloadAllComponents];
    [UtilityClass hideActivityIndicator];
}

static int sortParts(NSString *tech1, NSString *tech2, void *context)
{
    tech1 = [[partsDict objectForKey:tech1] valueForKey:PART_DESCRIPTION];
    tech2 = [[partsDict objectForKey:tech2] valueForKey:PART_DESCRIPTION];
    return [tech1 compare:tech2];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.partNumberTF.text = [partsArray objectAtIndex:row];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {    
    return [partsArray count];
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
    NSMutableDictionary *tech = [partsDict objectForKey:[partsArray objectAtIndex:row]];
    NSString *title = [tech valueForKey:PART_DESCRIPTION];
    tView.text = title;
    return tView;
}

- (IBAction) order
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doOrder) withObject:nil afterDelay:0.01];
}

- (void) doOrder
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *meterNum = [[[delegate.userInfo objectForKey:@"sars"] objectForKey:[delegate.userInfo valueForKey:@"currentSar"]] valueForKey:METER_NUMBER];
    NSMutableDictionary *dict = [NexusModel orderPartNum:self.partNumberTF.text withQuantity:self.quantityTF.text forEmployee:[delegate.userInfo valueForKey:@"employeeID"] andMeterNum:meterNum];
    [UtilityClass hideActivityIndicator];
    if (dict == nil) {
        NSLog(@"Order Parts: Failed");
    }
    else {
        NSLog(@"Order Parts: Success");
        [delegate.navigationController popViewControllerAnimated:YES];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    [UtilityClass dismissKeyboard];
}
@end
