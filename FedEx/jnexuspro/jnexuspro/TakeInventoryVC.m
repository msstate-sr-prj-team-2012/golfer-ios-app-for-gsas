//
//  TakeInventoryVC.m
//  jnexuspro
//
//  Created by C S on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TakeInventoryVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "AddPartVC.h"
#import "ViewPartVC.h"

@interface TakeInventoryVC ()

@end

@implementation TakeInventoryVC
@synthesize tableView = _tableView;
@synthesize partsDict = _partsDict;
@synthesize partsArray = _partsArray;
@synthesize meterNum = _meterNum;

NSNumber *selectedRow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.partsDict = [[NSMutableDictionary alloc] init];
        self.partsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Take Inventory";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveInventory)];
    self.navigationItem.rightBarButtonItem = button;
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView   
{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView  numberOfRowsInSection:(NSInteger)section
{
    return [self.partsArray count];
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
    NSString *part = [self.partsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"S/N:%@, P/N:%@", part, [[self.partsDict objectForKey:part] valueForKey:PART_NUMBER]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.partsDict objectForKey:part] valueForKey:PART_DESCRIPTION]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    
    ViewPartVC *view = [[ViewPartVC alloc] initWithNibName:@"ViewPartVC" bundle:nil];
    NSString *serial = [self.partsArray objectAtIndex:indexPath.row];
    view.partInfo = [self.partsDict objectForKey:serial];
    [delegate.navigationController pushViewController:view animated:YES];
}

- (IBAction) addPart
{
    AddPartVC *view = [[AddPartVC alloc] initWithNibName:@"AddPartVC" bundle:nil];
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    view.meterNum = self.meterNum;
    view.takingInventory = YES;
    [delegate.navigationController pushViewController:view animated:YES];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    selectedRow = nil;
}

- (IBAction) saveInventory
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doSaveInventory) withObject:nil afterDelay:0.01];
}

- (void) doSaveInventory
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"yyyy-MM-dd";
    NSString *currentDate = [dateFormater stringFromDate:[NSDate date]];
    NSMutableDictionary *dict = [NexusModel takeInventoryForMeter:self.meterNum withParts:self.partsArray andDate:currentDate]; 
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        NSLog(@"Take Inventory Failed");
    }
    else
    {
        NSLog(@"Take Inventory Success");
        [delegate.navigationController popViewControllerAnimated:YES];
    }
    
    
}

@end
