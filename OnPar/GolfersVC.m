//
//  GolfersVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolfersVC.h"
#import "AppDelegate.h"

@interface GolfersVC ()

@end

@implementation GolfersVC

@synthesize golferTableView;
@synthesize editButton;
@synthesize addButton;

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
    
    // get golfer info
    golfers = [[NSMutableArray alloc] init];
	NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	[db1 open];
	FMResultSet *fResult1= [db1 executeQuery:@"SELECT * FROM golfer"];
    
	while([fResult1 next])
	{
		golferName = [fResult1 stringForColumn:@"golfer_name"];
		[golfers addObject:golferName];
		NSLog(@"The data is %@=",golferName);
	}
    
	[db1 close];

    // Disable add button if 4 golfers already added
    if([golfers count] > 3)
    {
        // disable the button
        addButton.enabled = NO;
    }
    
    [golferTableView reloadData];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    //return [mainMenuOptions count];
    
    return [golfers count];
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 
 static NSString *simpleTableIdentifier = @"golferCell";
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
 }
 
 cell.textLabel.text = [golfers objectAtIndex:indexPath.row];
     
     NSLog(@"%d", indexPath.row);
 
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
