//
//  SarListVC.m
//  jnexuspro
//
//  Created by C S on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SarListVC.h"
#import "SarDetailsVC.h"
#import "SarContactVC.h"
#import "SarNotesVC.h"
#import "SarTimeVC.h"
#import "UpdateSarVC.h"
#import "NexusModel.h"

NSDictionary *sars;
NSString * uid;

@interface SarListVC ()

@end

@implementation SarListVC

@synthesize sarTableView = _sarTableView;
@synthesize sarList = _sarList;
@synthesize detailsViewController = _detailsViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
        uid = [[delegate.userInfo objectForKey:@"employeeInfo"]valueForKey:EMPLOYEE_ID];
        [self refresh];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"SARs";
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = refresh;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [UtilityClass cacheData];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    //return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void) viewWillAppear:(BOOL)animated
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];

}

- (void) viewWillDisappear:(BOOL)animated
{
    [UtilityClass cacheData];
}

- (void) start
{
    UpdateSarVC *updateVC = [[UpdateSarVC alloc] initWithNibName:@"UpdateSarVC" bundle:nil];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:updateVC animated:YES];
}

- (void) refresh
{
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doRefresh) withObject:nil afterDelay:0.01];
}

- (void) doRefresh
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    sars = [NexusModel getSarsForID:uid];
    [UtilityClass hideActivityIndicator];
    if (sars == nil)
    {
        sars = [delegate.userInfo objectForKey:@"sars"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Connectivity" message:@"Using cached data until connectivity is reestablished" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
        [delegate.userInfo setObject:dateString forKey:@"cacheDate"];
    }

    self.sarList = [[[sars allKeys] sortedArrayUsingFunction:sortSars context:NULL] mutableCopy];
    [delegate.userInfo setObject:sars forKey:@"sars"];
    [UtilityClass cacheData];
    [self.sarTableView reloadData];
}

static int sortSars(NSString *sar1, NSString *sar2, void *context)
{
    NSString *int1 = [[sars objectForKey:sar1] valueForKey:PRIORITY_STATUS];
    NSString *int2 = [[sars objectForKey:sar2] valueForKey:PRIORITY_STATUS];
    int comparison = [int1 compare:int2];
    if (comparison != NSOrderedSame)
        return comparison;
    NSDate *date1 = [[sars objectForKey:sar1] objectForKey:EXPIRATION_DATE];
    NSDate *date2 = [[sars objectForKey:sar2] objectForKey:EXPIRATION_DATE];
    return [date1 compare:date2];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView   
{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView  numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"Parts: %@", self.partsList);
    return [self.sarList count];
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"Updated: %@", [delegate.userInfo objectForKey:@"cacheDate"]);
    return [NSString stringWithFormat:@"Updated: %@", [delegate.userInfo objectForKey:@"cacheDate"]];
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [NSString stringWithFormat:@"SAR Numbers for ID #%@", uid];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Cell: Parts Lists - %@", self.partsList);
    static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
    NSString *sar = [self.sarList objectAtIndex:indexPath.row];
    NSDictionary *dict = [sars objectForKey:sar];
    NSString *address = [dict valueForKey:BUSINESS_NAME];
    address = [address stringByAppendingFormat:@": %@", [dict valueForKey:CITY]];
    address = [address stringByAppendingFormat:@", %@", [dict valueForKey:STATE]];
    address = [address stringByAppendingFormat:@", %@", [dict valueForKey:ZIP]];
    cell.detailTextLabel.text = address;
    sar = [sar stringByAppendingFormat:@": %@", [dict valueForKey:PROBLEM_DETAIL]];
    cell.textLabel.text = sar;
    
    
    
    //NSLog(@"Part %@", part);
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sar = [self.sarList objectAtIndex:indexPath.row];
    NSDictionary *dict = [sars objectForKey:sar];
    if([[dict valueForKey:PRIORITY_STATUS] isEqualToString:@"1"])
    {
        cell.backgroundColor = [UIColor redColor];//[UIColor colorWithRed:1. green:.25 blue:.25 alpha:1.];
    }
    else if([[dict valueForKey:PRIORITY_STATUS] isEqualToString:@"2"])
    {
        cell.backgroundColor = [UIColor orangeColor];//colorWithRed:(13./16.) green:(7./16.) blue:0. alpha:1];
        
    }
    else if([[dict valueForKey:PRIORITY_STATUS] isEqualToString:@"3"] || [[dict valueForKey:PRIORITY_STATUS] isEqualToString:@""])
    {
        cell.backgroundColor = [UIColor yellowColor];//colorWithRed:(7./16.) green:1. blue:(13./16.) alpha:1];
        
    }
    else if([[dict valueForKey:PRIORITY_STATUS] isEqualToString:@"4"])
    {
        cell.backgroundColor = [UIColor greenColor];//colorWithRed:(13./16.) green:1. blue:(10./16.) alpha:1];
        
    }
    
    cell.detailTextLabel.textColor = [UIColor colorWithRed:.25 green:.25 blue:.25 alpha:1.];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
    
    
    
    SarDetailsVC *detailsTab = [[SarDetailsVC alloc] initWithNibName:@"SarDetailsVC" bundle:nil];
    detailsTab.sarNum = [self.sarList objectAtIndex:indexPath.row];
    detailsTab.sarInfo = [[delegate.userInfo dictionaryForKey:@"sars"] objectForKey:detailsTab.sarNum];

    [delegate.userInfo setValue:detailsTab.sarNum forKey:@"currentSar"];
    
    SarContactVC *contactTab = [[SarContactVC alloc] initWithNibName:@"SarContactVC" bundle:nil];   
    contactTab.sarInfo = [[delegate.userInfo dictionaryForKey:@"sars"] objectForKey:detailsTab.sarNum];
    SarNotesVC *notesTab = [[SarNotesVC alloc] initWithNibName:@"SarNotesVC" bundle:nil];
    notesTab.sarInfo = [[delegate.userInfo dictionaryForKey:@"sars"] objectForKey:detailsTab.sarNum];

    
    delegate.sarTabBarController = [[UITabBarController alloc] init];
    delegate.sarTabBarController.viewControllers = [NSArray arrayWithObjects:detailsTab, contactTab, notesTab, nil];
    
    delegate.sarTabBarController.title = [NSString stringWithFormat:@"SAR #%@", detailsTab.sarNum];
    UIBarButtonItem *start = [[UIBarButtonItem alloc] initWithTitle:@"Manage" style:UIBarButtonItemStyleBordered target:self action:@selector(start)];
    delegate.sarTabBarController.navigationItem.rightBarButtonItem = start;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStyleBordered target:self action:nil];
    delegate.sarTabBarController.navigationItem.backBarButtonItem = back;

    [delegate.navigationController pushViewController:delegate.sarTabBarController animated:YES];
}


@end
