//
//  OrderHistoryVC.m
//  jnexuspro
//
//  Created by Apple on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OrderHistoryVC.h"
#import "AppDelegate.h"
#import "NexusModel.h"
#import "UtilityClass.h"
#import "ViewOrderVC.h"

@interface OrderHistoryVC ()

@end

NSMutableDictionary *orderDict;
NSMutableArray *orderArray;

@implementation OrderHistoryVC

@synthesize orderTableView = _orderTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
        [self.view addSubview:delegate.activityIndicator];
        [UtilityClass showActivityIndicator];
        [self performSelector:@selector(showOrders) withObject:nil afterDelay:0.01];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Order History";

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void) viewWillAppear:(BOOL)animated
{
}

- (void) showOrders
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    orderDict = [NexusModel getOrdersForID:[delegate.userInfo valueForKey:@"employeeID"]];
    [UtilityClass hideActivityIndicator];
    if (orderDict == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Connectivity" message:@"Using cached data until connectivity is reestablished" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        NSLog(@"Order History Success");
    }
    
    orderArray = [[[orderDict allKeys] sortedArrayUsingFunction:sortOrders context:NULL] mutableCopy];
    [self.orderTableView reloadData];
}

static int sortOrders(NSString *sar1, NSString *sar2, void *context)
{
    NSString *int1 = [[orderDict objectForKey:sar1] valueForKey:METER_NUMBER];
    NSString *int2 = [[orderDict objectForKey:sar2] valueForKey:METER_NUMBER];
    return [int1 compare:int2];
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
    return [orderArray count];
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Orders by Meter Number";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Cell: Parts Lists - %@", self.partsList);
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    
    NSString *orderNum = [orderArray objectAtIndex:indexPath.row];
    NSDictionary *dict = [orderDict objectForKey:orderNum];
    NSString *meter = [dict valueForKey:METER_NUMBER];
    NSString *text = [NSString stringWithFormat:@"%@: Meter #%@", [dict valueForKey:BUSINESS_NAME], meter];
    NSString *detail = [NSString stringWithFormat:@"P/N: %@; QTY: %@, Status: %@", [dict valueForKey:PART_NUMBER],[dict valueForKey:QUANTITY], [dict valueForKey:ORDER_STATUS]];

    cell.textLabel.text = text;
    cell.detailTextLabel.text = detail;    
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *sar = [orderArray objectAtIndex:indexPath.row];
    //NSDictionary *dict = [orderDict objectForKey:sar];
    
    cell.detailTextLabel.textColor = [UIColor colorWithRed:.25 green:.25 blue:.25 alpha:1.];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    
    ViewOrderVC *view = [[ViewOrderVC alloc] initWithNibName:@"ViewOrderVC" bundle:nil];
    view.orderInfo = [orderDict objectForKey:[orderArray objectAtIndex:indexPath.row]];
    [delegate.navigationController pushViewController:view animated:YES];
}


@end
