//
//  ShotSequenceVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ShotSequenceVC.h"

@interface ShotSequenceVC ()

@end

@implementation ShotSequenceVC{
    BOOL direction;
    BOOL club;
    BOOL hit;
    BOOL ended;
    BOOL putting;
    int alertIndex;
    CLLocationManager *locationManager;
}

@synthesize tableView;
@synthesize intendedDirection, clubSelection, hitTheBall;
@synthesize penaltyOptions, endShot;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

// this method does get called now
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

        NSLog(@"ShotSequenceVC appeared");
    
    // get shared data
    dataManager *myDataManager = [dataManager myDataManager];
    
    int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
    
    // get current hole and shot number
    int shot = [[[myDataManager.golfers objectAtIndex:selectedGolfer] valueForKey:@"shotCount"] intValue];
    
    int hole = [[[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"holeNum"] intValue];
    
    NSLog(@"Hole: %i, Shot: %i", hole, shot);
}

// this method does not get called
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"ShotSequenceVC loaded");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // Setting Checkmark after completion
    // Check Status, then execute below code
    //[intendedDirection setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    
    // get shared data
    //dataManager *myDataManager = [dataManager myDataManager];
    
    if (theCellClicked == hitTheBall) {
        NSLog(@"Button press: 'Hit The Ball'");
        
        // Cancel Confirmation
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: NSLocalizedString(@"Hit The Ball",nil)
                              message: NSLocalizedString(@"Press OK when you are at the ball's starting location.",nil)
                              delegate: self
                              cancelButtonTitle: NSLocalizedString(@"Cancel",nil)
                              otherButtonTitles: NSLocalizedString(@"OK",nil), nil];
        alert.tag = 1;
        alertIndex = alert.tag;
        [alert show];
    }
    
    
    if (theCellClicked == endShot) {
        NSLog(@"Button press: 'End Shot'");
        
        // Cancel Confirmation
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: NSLocalizedString(@"End The Shot",nil)
                              message: NSLocalizedString(@"Press OK when you are at the ball's ending location.",nil)
                              delegate: self
                              cancelButtonTitle: NSLocalizedString(@"Cancel",nil)
                              otherButtonTitles: NSLocalizedString(@"OK",nil), nil];
        alert.tag = 2;
        alertIndex = alert.tag;
        [alert show];
        
    }

}


// Called when an alertview button is touched
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    // get shared data
    //dataManager *myDataManager = [dataManager myDataManager];
    
    switch (buttonIndex){
        case 0:
            
            if (alertView.tag == 1)
            {
                // Cancel - cancel hit
                NSLog(@"Button press: 'Cancel' - cancel hit");
            }
            if (alertView.tag == 2)
            {
                // Cancel - do not end shot
                NSLog(@"Button press: 'Cancel' - do not end shot");
            }
            break;
            
        case 1:
            
            if (alertView.tag == 1)
            {
                // OK - get starting location
                NSLog(@"Button press: 'OK' - get starting location");
                
                locationManager = [[CLLocationManager alloc] init];
                
                locationManager.delegate = self;
                locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                
                [locationManager startUpdatingLocation];
            }
            
            if (alertView.tag == 2)
            {
                // OK - get ending location
                NSLog(@"Button press: 'OK' - get ending location");
                
                locationManager = [[CLLocationManager alloc] init];
                
                locationManager.delegate = self;
                locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                
                [locationManager startUpdatingLocation];
                
                dataManager *myDataManager = [dataManager myDataManager];
                Shot *s = [[Shot alloc] init];
                int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
                s._shotNumber = [[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"shotCount"] intValue];
                s._club = 11;
                
                s._aimLatitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"aimLatitude"] doubleValue];
                s._aimLongitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"aimLongitude"] doubleValue];
                s._startLatitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"startLatitude"] doubleValue];
                s._startLongitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"startLongitude"] doubleValue];
                //s._endLatitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"endLatitude"] doubleValue];
                //s._endLongitude = [[[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"currentShot"] valueForKey: @"endLongitude"] doubleValue];
                
                s._endLatitude = 33.12343456;
                s._endLongitude = -88.1234;
                
                int holeNumber = [[[myDataManager.golfers objectAtIndex: selectedGolfer] valueForKey: @"holeNum"] intValue] + 1;
                int uid = [[[myDataManager users] objectAtIndex: selectedGolfer] uid];
                
                Hole *h = [myDataManager addShot: s toHoleWithHoleNumber: holeNumber forUserWithID: uid];
                NSLog(@"Shot: %@", [s export]);
                NSLog(@"Hole: %@", [h export]);
            }
            
            
            
            break;
    }
}



- (IBAction)changeGolfer:(id)sender {
    
    // Goes back 2 view controllers
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:[self.navigationController.viewControllers count]-3] animated:YES];
}


- (void)viewDidUnload {
    [self setHitTheBall:nil];
    [self setClubSelection:nil];
    [self setIntendedDirection:nil];
    [self setPenaltyOptions:nil];
    [self setEndShot:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}



#pragma mark - CLLocationManagerDelegate


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        
        dataManager *myDataManager = [dataManager myDataManager];
        
        // get selected golfer
        int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
        
        if (alertIndex == 1)
        {
            // set startLatitude and startLongitude for currentShot
            [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude] forKey:@"startLatitude"];
        
            NSLog(@"startLatitude is: %f", currentLocation.coordinate.latitude);
        
            [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude] forKey:@"startLongitude"];
     
            NSLog(@"startLongitude is: %f", currentLocation.coordinate.longitude);
        }
        
        if (alertIndex == 2)
        {
            //__block int status = -1;
            // set startLatitude and startLongitude for currentShot
            [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude] forKey:@"endLatitude"];
            
            NSLog(@"endLatitude is: %f", currentLocation.coordinate.latitude);
            
            [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude] forKey:@"endLongitude"];
            
            NSLog(@"endLongitude is: %f", currentLocation.coordinate.longitude);
            
            //while (status == -1)
                //[[NSRunLoop currentRunLoop] runUntilDate: [NSDate dateWithTimeIntervalSinceNow: 0.01]];
        }

        // Stop Location Manager
        [locationManager stopUpdatingLocation];
    }
}


@end
