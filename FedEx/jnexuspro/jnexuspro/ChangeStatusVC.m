//
//  ChangeStatusVC.m
//  jnexuspro
//
//  Created by Apple on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChangeStatusVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"
#import "NexusModel.h"

@interface ChangeStatusVC ()

@end

@implementation ChangeStatusVC
@synthesize statusChangeTF = _statusChangeTF;
@synthesize statusPicker = _statusPicker;

NSMutableDictionary *statusDict;
NSMutableArray *statusArray;

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
    self.title = @"Change Status";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:self action:@selector(changeStatus)];
    self.navigationItem.rightBarButtonItem = button;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (void)viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(retrieveStatusList) withObject:nil afterDelay:0.01];
}

- (void) retrieveStatusList
{
    statusDict = [NexusModel getStatusList];
    if (statusDict == nil)
        NSLog(@"Failed to retrieve statuses");
    statusArray = [[[statusDict allKeys] sortedArrayUsingFunction:sortStatuses context:NULL] mutableCopy];
    [self.statusPicker reloadAllComponents];
    [UtilityClass hideActivityIndicator];
}

static int sortStatuses(NSString *tech1, NSString *tech2, void *context)
{
    tech1 = [[statusDict objectForKey:tech1] valueForKey:STATUS_DETAIL];
    tech2 = [[statusDict objectForKey:tech2] valueForKey:STATUS_DETAIL];
    return [tech1 compare:tech2];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.statusChangeTF.text = [statusArray objectAtIndex:row];
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {    
    return [statusArray count];
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
    NSMutableDictionary *tech = [statusDict objectForKey:[statusArray objectAtIndex:row]];
    NSString *title = [tech valueForKey:STATUS_DETAIL];
    tView.text = title;
    return tView;
}

- (void) changeStatus
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doChangeStatus) withObject:nil afterDelay:0.01];
}

- (void) doChangeStatus
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *dict = [NexusModel changeStatusForSar:currentSar toStatus:self.statusChangeTF.text];
    [UtilityClass hideActivityIndicator];
    if (dict == nil){
        NSLog(@"Change Status Failed");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Change Status Failed" message:@"Check status entered or network connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        NSLog(@"Change Status Succeeded");
        [delegate.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

@end
