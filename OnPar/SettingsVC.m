//
//  SettingsVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/26/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "SettingsVC.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

@synthesize startingHoleTextField;

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
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveSettings:(id)sender {
    // get value from text field
    NSNumber *startHole = [NSNumber numberWithInt:[startingHoleTextField.text intValue]];
    
    
    // Insert startHole into DB
    NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	if(![db1 open])
        NSLog(@"database could not open");
    
    FMResultSet *fResult1= [db1 executeQuery:@"SELECT * FROM info"];
    
    NSNumber *courseID;
    
	if([fResult1 next])
	{
		courseID = [NSNumber numberWithInt:[fResult1 intForColumn:@"course_id"]];
	}
    
    NSLog(@"course id is %@", path1);
    
    BOOL success = [db1 executeUpdate:@"UPDATE info SET starting_hole = ? WHERE course_id = ?", startHole, courseID];
    
	/* Closing the Database */
	[db1 close];
    
    // debugging
    if(success)
        NSLog(@"success");
    else
        NSLog(@"failure");
    

    
    // push next view onto nav controller
    [self performSegueWithIdentifier:@"saveSettings" sender:nil];
}
- (void)viewDidUnload {
    [self setStartingHoleTextField:nil];
    [super viewDidUnload];
}


#pragma mark - text field methods
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.startingHoleTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)dismissKeyboard{
    [startingHoleTextField resignFirstResponder];
}

@end
