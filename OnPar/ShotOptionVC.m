//
//  ShotOptionVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ShotOptionVC.h"

@interface ShotOptionVC ()

@end

@implementation ShotOptionVC{
    BOOL shotStarted;
}

@synthesize nrButton;
@synthesize cancelButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShotOption";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}
*/


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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
    
    if (theCellClicked == nrButton) {

        // New or Resume Shot?
        if(shotStarted == FALSE)
        {
            // New Shot
            NSLog(@"Button press: 'New Shot'");
            shotStarted = TRUE;
            
            // Change label to resume shot
            nrButton.textLabel.text = @"Resume Shot";
            UIImage *nrImage = [UIImage imageNamed:@"resume.png"];
            [nrButton.imageView setImage:nrImage];
            
            // Create cancel shot button
            cancelButton.textLabel.text = @"Cancel Shot";
            UIImage *cancelImage = [UIImage imageNamed:@"cancel.png"];
            [cancelButton.imageView setImage:cancelImage];
            [cancelButton setHidden:NO];
            
            [tableView reloadData];
            
        }
        else
        {
            // Resume Shot
            NSLog(@"Button press: 'Resume Shot'");
        }
 
    }
 
    if (theCellClicked == cancelButton) {
        NSLog(@"Button press: 'Cancel Shot'");
        
        // Cancel Confirmation 
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: NSLocalizedString(@"Cancel Shot",nil)
                                  message: NSLocalizedString(@"Are you sure you want to cancel the current shot?",nil)
                                  delegate: self
                                  cancelButtonTitle: NSLocalizedString(@"NO",nil)
                                  otherButtonTitles: NSLocalizedString(@"YES",nil), nil];
            [alert show];
        }
}

// Called when an alertview button is touched
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
        switch (buttonIndex){
            case 0:
            
                // NO - do not cancel
                NSLog(@"Button press: 'NO' - cancel stopped");
                break;
                    
            case 1:
            
                // YES - cancel shot
                NSLog(@"Button press: 'YES' - shot cancelled");
                shotStarted = FALSE;
                    
                // Change label to resume shot
                nrButton.textLabel.text = @"New Shot";
                UIImage *image = [UIImage imageNamed:@"add.png"];
                [nrButton.imageView setImage:image];
                    
                // Unhide cancel shot
                [cancelButton setHidden:YES];
                
                // Reload tableview
                [self.tableView reloadData];
                break;
        }

    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    */

}

- (void)viewDidUnload {
    [self setNrButton:nil];
    [self setCancelButton:nil];
    [super viewDidUnload];
}
@end
