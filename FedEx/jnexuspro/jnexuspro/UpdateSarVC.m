//
//  UpdateSarVC.m
//  jnexuspro
//
//  Created by Apple on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UpdateSarVC.h"
#import "AppDelegate.h"
#import "ViewInventoryVC.h"
#import "AddPartVC.h"
#import "SarTimeVC.h"
#import "AddCommentsVC.h"
#import "OrderPartsVC.h"
#import "UpdateContactVC.h"
#import "TransferTicketVC.h"
#import "ChangeStatusVC.h"
#import "CloseTicketVC.h"
#import "NexusModel.h"
#import "UpdateTravelVC.h"
#import "UpdateInterruptVC.h"
#import "UpdateAddressVC.h"


SarTimeVC *timeTab;
UpdateInterruptVC *interruptTab;
UpdateTravelVC *travelTab;
UpdateContactVC *infoTab;
UpdateAddressVC *addressTab;
UITabBarController *tabBarController;
@interface UpdateSarVC ()

@end

@implementation UpdateSarVC

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
    self.title = @"Manage";
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

- (IBAction)viewInventory
{
    ViewInventoryVC *viewInventory = [[ViewInventoryVC alloc] initWithNibName:@"ViewInventoryVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *sarInfo = [[delegate.userInfo objectForKey:@"sars"] objectForKey:currentSar];
    viewInventory.meterNum = [sarInfo valueForKey:METER_NUMBER];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction)updateTime
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    timeTab = [[SarTimeVC alloc] initWithNibName:@"SarTimeVC" bundle:nil];
    interruptTab = [[UpdateInterruptVC alloc] initWithNibName:@"UpdateInterruptVC" bundle:nil];
    travelTab = [[UpdateTravelVC alloc] initWithNibName:@"UpdateTravelVC" bundle:nil];   
    delegate.timeTravelTabBarController = [[UITabBarController alloc] init];
    delegate.timeTravelTabBarController.viewControllers = [NSArray arrayWithObjects:timeTab,travelTab, interruptTab, nil];
    delegate.timeTravelTabBarController.title = @"Time/Travel";
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveTime)];
    delegate.timeTravelTabBarController.navigationItem.rightBarButtonItem = save;
    [delegate.navigationController pushViewController:delegate.timeTravelTabBarController animated:YES];
}

- (IBAction)addComments
{
    AddCommentsVC *viewInventory = [[AddCommentsVC alloc] initWithNibName:@"AddCommentsVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) orderParts
{
    OrderPartsVC *viewInventory = [[OrderPartsVC alloc] initWithNibName:@"OrderPartsVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) updateContact
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    infoTab = [[UpdateContactVC alloc] initWithNibName:@"UpdateContactVC" bundle:nil];
    addressTab = [[UpdateAddressVC alloc] initWithNibName:@"UpdateAddressVC" bundle:nil];
    tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:infoTab,addressTab, nil];
    tabBarController.title = @"Contact Info";
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStyleBordered target:self action:@selector(updateInfo)];
    tabBarController.navigationItem.rightBarButtonItem = save;
    [delegate.navigationController pushViewController:tabBarController animated:YES];
}

- (IBAction) transferTicket
{
    TransferTicketVC *viewInventory = [[TransferTicketVC alloc] initWithNibName:@"TransferTicketVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) changeStatus
{
    ChangeStatusVC *viewInventory = [[ChangeStatusVC alloc] initWithNibName:@"ChangeStatusVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) closeTicket
{
    CloseTicketVC *viewInventory = [[CloseTicketVC alloc] initWithNibName:@"CloseTicketVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) saveTime
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.timeTravelTabBarController.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doSaveTime) withObject:nil afterDelay:0.01];
}

- (void) doSaveTime
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *sars = [[delegate.userInfo objectForKey:@"sars"] mutableCopy];
    NSMutableDictionary *sarInfo = [[sars objectForKey:currentSar] mutableCopy];
    
    NSMutableArray *fields = [[NSMutableArray alloc] initWithObjects:START_TRAVEL_TIME, ARRIVE_TIME, TRAVEL_MILES, INTERRUPT_TRAVEL_TIME, INTERUPT_JOB_TIME, DEPART_TIME, RETURN_TIME, RETURN_MILES, nil];
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithCapacity:10];
    for (NSString *field in fields)
        [info setObject:[sarInfo valueForKey:field] forKey:field];
    
    if (timeTab.travelStartTime.text != nil)
        [info setObject:timeTab.travelStartTime.text forKey:START_TRAVEL_TIME];
    if (timeTab.jobStartTime.text != nil)
        [info setObject:timeTab.jobStartTime.text forKey:ARRIVE_TIME];
    if (travelTab.travelMiles.text != nil)
        [info setObject:travelTab.travelMiles.text forKey:TRAVEL_MILES];
    if (interruptTab.travelInterruptMinutes.text != nil)
        [info setObject:interruptTab.travelInterruptMinutes.text forKey:INTERRUPT_TRAVEL_TIME];
    if (interruptTab.jobInterruptMinutes.text != nil)
        [info setObject:interruptTab.jobInterruptMinutes.text forKey:INTERUPT_JOB_TIME];
    if (timeTab.jobEndTime.text != nil)
        [info setObject:timeTab.jobEndTime.text forKey:DEPART_TIME];
    if (timeTab.returnTime.text != nil)
        [info setObject:timeTab.returnTime.text forKey:RETURN_TIME];
    if (travelTab.returnMiles.text != nil)
        [info setObject:travelTab.returnMiles.text forKey:RETURN_MILES];
        
    NSMutableDictionary *dict = [NexusModel saveTimeTravel:info ForSar:currentSar];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Update Travel Info: Success");
    }
    else {
        NSLog(@"Update Travel Info: Success");
        for (NSString *field in fields)
            [sarInfo setObject:[info valueForKey:field] forKey:field];
        [sars setObject:sarInfo forKey:currentSar];
        [delegate.userInfo setObject:sars forKey:@"sars"];
        [UtilityClass cacheData];
        [delegate.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction) updateInfo
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [tabBarController.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doUpdateInfo) withObject:nil afterDelay:0.01];
}

- (void) doUpdateInfo
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSString *currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSString *accountNum = [[[delegate.userInfo objectForKey:@"sars"] objectForKey:currentSar] valueForKey:ACCOUNT_NUM];
    NSMutableDictionary *sars = [[delegate.userInfo objectForKey:@"sars"] mutableCopy];
    NSMutableDictionary *sarInfo = [[sars objectForKey:currentSar] mutableCopy];
    
    NSMutableDictionary *info = [[NSMutableDictionary alloc] initWithCapacity:10];

    NSMutableArray *fields = [[NSMutableArray alloc] initWithObjects:BUSINESS_NAME, ADDRESS_LINE1, ADDRESS_LINE2, CITY, STATE, ZIP, CONTACT_NAME, CONTACT_NUMBER, nil];
    for (NSString *field in fields)
        [info setObject:[sarInfo valueForKey:field] forKey:field];
    
    if (infoTab.businessNameTF.text != nil)
        [info setObject:infoTab.businessNameTF.text forKey:BUSINESS_NAME];
    if (addressTab.addressLine1TF.text != nil)
        [info setObject:addressTab.addressLine1TF.text forKey:ADDRESS_LINE1];
    if (addressTab.addressLine2TF.text != nil)
        [info setObject:addressTab.addressLine2TF.text forKey:ADDRESS_LINE2];
    if (addressTab.cityTF.text != nil)
        [info setObject:addressTab.cityTF.text forKey:CITY];
    if (addressTab.stateTF.text != nil)
        [info setObject:addressTab.stateTF.text forKey:STATE];
    if (addressTab.zipTF.text != nil)
        [info setObject:addressTab.zipTF.text forKey:ZIP];
    if (infoTab.contactNameTF.text != nil)
        [info setObject:infoTab.contactNameTF.text forKey:CONTACT_NAME];
    if (infoTab.contactNumberTF.text != nil)
        [info setObject:infoTab.contactNumberTF.text forKey:CONTACT_NUMBER];
    
    NSMutableDictionary *dict = [NexusModel saveContactInfoForAccount:accountNum withInfo:info];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Update Contact Info: Failure");
    }
    else {
        NSLog(@"Update Contact Info: Success");
        for (NSString *field in fields)
            [sarInfo setObject:[info valueForKey:field] forKey:field];
        [sars setObject:sarInfo forKey:currentSar];
        [delegate.userInfo setObject:sars forKey:@"sars"];
        [UtilityClass cacheData];
        [delegate.navigationController popViewControllerAnimated:YES];
    }
}


@end
