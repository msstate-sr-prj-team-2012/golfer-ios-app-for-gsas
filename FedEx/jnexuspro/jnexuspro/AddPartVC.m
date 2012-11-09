//
//  AddPartVC.m
//  jnexuspro
//
//  Created by Apple on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddPartVC.h"
#import "AppDelegate.h"
#import "UpdateSarVC.h"
#import "NexusModel.h"
#import "TakeInventoryVC.h"

@interface AddPartVC ()

@end

NSDictionary *info;

@implementation AddPartVC
@synthesize meterNum = _meterNum;
@synthesize scanSerialValue = _scanSerialValue;
@synthesize serialLabel = _serialLabel;
@synthesize partLabel = _partLabel;
@synthesize descLabel = _descLabel;
@synthesize submitPartButton = _submitPartButton;
@synthesize scanAlert = _scanAlert;
@synthesize takingInventory = _takingInventory;

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
    // Do any additional setup after loading the view from its nib.
    self.title = @"Add Part";
    self.submitPartButton.enabled = NO;
    self.submitPartButton.title = @"Unverified";
    self.submitPartButton.tintColor = [UIColor grayColor];
    self.descLabel.editable = NO;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addToInventory)];
    button.enabled = NO;
    button.title = @"Unverified";
    button.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = button;
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

- (IBAction) returnToInventory
{
    [self.parentViewController viewWillAppear:YES];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController popViewControllerAnimated:YES];
}

- (IBAction) verifySerialNumber
{
    [self.scanSerialValue resignFirstResponder];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doVerifySerialNumber) withObject:nil afterDelay:0.01];
}

- (void) doVerifySerialNumber
{
    info = [NexusModel getPartInfoForSerial:self.scanSerialValue.text];
    [UtilityClass hideActivityIndicator];
    if(info)
    {
        //Display info;
        self.serialLabel.text = [info objectForKey:SERIAL_NUMBER];
        self.descLabel.text = [info objectForKey:PART_DESCRIPTION];
        self.partLabel.text = [info objectForKey:PART_NUMBER];
        
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem.title = @"Confirm";
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor colorWithRed:(7./16) green:0. blue:(13./16.) alpha:1];
        self.submitPartButton.enabled = YES;
        self.submitPartButton.title = @"Confirm";
        [self.submitPartButton setTintColor:[UIColor blackColor]];
    }
    else 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Serial Number" message:[NSString stringWithFormat:@"Serial Number %@ not found in database", self.scanSerialValue.text] delegate:nil cancelButtonTitle:@"Proceed" otherButtonTitles:nil];
        [alert show];
    }
}

- (NSDictionary *) checkDBForSerialNumber:(NSString *) serialValue
{
    return nil;
}

- (IBAction) scanSerialNumber
{
    self.scanAlert = [[UIAlertView alloc] initWithTitle:@"Scan NFC Tag" message:@"Hover device over tag, and press Scan" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Scan", nil];
    [self.scanAlert show];
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index: %d", buttonIndex);
    if (buttonIndex == 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Case Not Attached" message:@"Please attach case to perform NFC Scan" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction) addToInventory
{
    if (self.takingInventory)
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        int inventoryIndex = [delegate.navigationController.viewControllers count] - 2;
        TakeInventoryVC *parent = [delegate.navigationController.viewControllers objectAtIndex:inventoryIndex];
        if ([parent.partsDict objectForKey:self.scanSerialValue.text] == nil)
        {
            [parent.partsArray addObject:self.scanSerialValue.text];
            [parent.partsDict setObject:info forKey:self.scanSerialValue.text];
        }
        [self returnToInventory];
    }
    else 
    {
        [UtilityClass showActivityIndicator];
        [self performSelector:@selector(doAddPartToInventory) withObject:nil afterDelay:0.01];
    }
}

- (void) doAddPartToInventory
{
    NSArray *parts = [[NSArray alloc] initWithObjects:self.scanSerialValue.text, nil];
    NSMutableDictionary *dict = [NexusModel addParts:parts ForMeter:self.meterNum];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Add Part Failed");
    }
    else
    {
        [self returnToInventory];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.scanSerialValue resignFirstResponder];
}

@end
