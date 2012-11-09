//
//  ViewInventoryVC.m
//  jnexuspro
//
//  Created by Apple on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewInventoryVC.h"
#import "NexusModel.h"
#import "AppDelegate.h"
#import "ViewPartVC.h"
#import "AddPartVC.h"
#import "TakeInventoryVC.h"

@interface ViewInventoryVC ()

@end

@implementation ViewInventoryVC

@synthesize inventoryTable = _inventoryTable;
@synthesize meterNum = _meterNum;
@synthesize meterInventory = _meterInventory;
@synthesize serialNums = _serialNums;

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
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    self.title = @"Inventory";
    if ([[[delegate.userInfo dictionaryForKey:@"employeeInfo"] valueForKey:EMPLOYEE_VANMETERNUM] isEqualToString:self.meterNum])
        self.title = @"Van Inventory";

    //NSLog(@"Meter Inventory: %@", self.meterInventory);
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
    //return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView   
{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView  numberOfRowsInSection:(NSInteger)section
{
    return [self.serialNums count];
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Serial Numbers";
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Meter #%@", self.meterNum];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    NSString *part = [self.serialNums objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"S/N:%@, P/N:%@", part, [[self.meterInventory objectForKey:part] valueForKey:PART_NUMBER]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.meterInventory objectForKey:part] valueForKey:PART_DESCRIPTION]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    
    ViewPartVC *view = [[ViewPartVC alloc] initWithNibName:@"ViewPartVC" bundle:nil];
    NSString *serial = [self.serialNums objectAtIndex:indexPath.row];
    view.partInfo = [self.meterInventory objectForKey:serial];
    [delegate.navigationController pushViewController:view animated:YES];
}

- (IBAction) addPart
{
    AddPartVC *view = [[AddPartVC alloc] initWithNibName:@"AddPartVC" bundle:nil];
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    view.meterNum = self.meterNum;
    view.takingInventory = NO;
    [delegate.navigationController pushViewController:view animated:YES];
}

- (IBAction)takeInventory
{
    TakeInventoryVC *view = [[TakeInventoryVC alloc] initWithNibName:@"TakeInventoryVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    view.meterNum = self.meterNum;
    [delegate.navigationController pushViewController:view animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(getInventory) withObject:nil afterDelay:0.01];
}

- (void) getInventory
{
    self.meterInventory = [NexusModel getPartsForMeter:self.meterNum];
    self.serialNums = [[self.meterInventory allKeys] mutableCopy];
    [self.inventoryTable reloadData];
    [UtilityClass hideActivityIndicator];
}

- (void) viewWillDisappear:(BOOL)animated 
{
    [UtilityClass cacheData];
}

@end
