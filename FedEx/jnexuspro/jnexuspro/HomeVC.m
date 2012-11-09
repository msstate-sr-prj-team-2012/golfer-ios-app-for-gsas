//
//  HomeVC.m
//  jnexuspro
//
//  Created by Apple on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "SarListVC.h"
#import "ViewInventoryVC.h"
#import "OrderHistoryVC.h"
#import "CreateTicketVC.h"
#import "WebViewVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Home";
    //UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Admin" style:UIBarButtonItemStyleBordered target:self action:@selector(admin)];
    //self.navigationItem.rightBarButtonItem = button;
}

- (void) admin
{
    //WebViewVC *view = [[WebViewVC alloc] initWithNibName:@"WebViewVC" bundle:nil];
    //AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    //[delegate.navigationController pushViewController:view animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void) viewWillDisappear:(BOOL)animated
{
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)viewSars
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    SarListVC *viewController = [[SarListVC alloc] initWithNibName:@"SarListVC" bundle:nil];
    [delegate.navigationController pushViewController:viewController animated:YES];
}

- (IBAction) vanInventory
{

    ViewInventoryVC *viewInventory = [[ViewInventoryVC alloc] initWithNibName:@"ViewInventoryVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    viewInventory.meterNum= [[delegate.userInfo objectForKey:@"employeeInfo"] objectForKey:EMPLOYEE_VANMETERNUM];
    [delegate.navigationController pushViewController:viewInventory animated:YES];
}

- (IBAction) orderHistory
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    OrderHistoryVC *viewController = [[OrderHistoryVC alloc] initWithNibName:@"OrderHistoryVC" bundle:nil];
    [delegate.navigationController pushViewController:viewController animated:YES];
}

- (IBAction) newTicket
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    CreateTicketVC *viewController = [[CreateTicketVC alloc] initWithNibName:@"CreateTicketVC" bundle:nil];
    [delegate.navigationController pushViewController:viewController animated:YES];
}
@end
