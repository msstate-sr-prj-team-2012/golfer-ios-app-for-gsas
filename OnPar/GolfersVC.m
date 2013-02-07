//
//  GolfersVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolfersVC.h"
#import "AppDelegate.h"
#import "GolferAddVC.h"

@interface GolfersVC ()

@end

@implementation GolfersVC{
    dataManager *myDataManager;
}

@synthesize golferTableView;
@synthesize editButton, addButton, doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"GolfersVC has appeared");
    
    // get shared data
    myDataManager = [dataManager myDataManager];
 
    // Disable add button if 4 golfers already added
    if([myDataManager.golfers count] > 3)
    {
        // disable the button
        addButton.enabled = NO;
    }
    
    if ([myDataManager.golfers count] > 0){
        [doneButton setEnabled:YES];
    }
    
    // reload tableview to reflect updates
    [golferTableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"GolfersVC has loaded");
    
	// Do any additional setup after loading the view.
    
    // Set edit button
    editButton.style = UIBarButtonItemStyleBordered;
    editButton.title = @"Edit";
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)editOrder:(id)sender {
    
    //need to re-enable this, figure out how to reorder, and what happens when delete is pressed
    
    if(golferTableView.editing == NO){
        // Set to done
        editButton.style = UIBarButtonItemStyleDone;
        editButton.title = @"Done";
        [golferTableView setEditing:YES animated:YES];
    }
    else{
        // Set back to edit
        editButton.style = UIBarButtonItemStyleBordered;
        editButton.title = @"Edit";
        
        [golferTableView setEditing:NO animated:YES];
    }
}


- (void)viewDidUnload {
    [self setEditButton:nil];
    [self setAddButton:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
}



#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [myDataManager.golfers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *CellIdentifier = @"Right Detail";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
     if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
     }
     
     cell.textLabel.text = [[myDataManager.golfers objectAtIndex:indexPath.row] valueForKey:@"golferName"];
     
    cell.detailTextLabel.text = [[myDataManager.golfers objectAtIndex:indexPath.row] valueForKey:@"golferID"];
     
     return cell;
}


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


@end
