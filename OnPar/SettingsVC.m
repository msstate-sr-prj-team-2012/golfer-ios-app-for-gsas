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

@implementation SettingsVC{
    dataManager *myDataManager;
}

@synthesize startingHoleTextField;

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
    
    NSLog(@"SettingsVC has appeared");
    
    // get shared data
    myDataManager = [dataManager myDataManager];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"SettingsVC has loaded");
    
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
    [myDataManager.roundInfo setValue:startingHoleTextField.text forKey:@"startHole"];
    
    for(int i=0; i < [myDataManager.golfers count]; i++)
    {
        NSMutableDictionary *currentHole = [[NSMutableDictionary alloc] init];
        
        // create first hole
        [currentHole setValue:startingHoleTextField.text forKey:@"holeNum"];
        
        [[myDataManager.golfers objectAtIndex:i] setObject:currentHole forKey:@"currentHole"];
        
        [[myDataManager.golfers objectAtIndex:i] setValue:@"1" forKey:@"holeCount"];
    }
    
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
