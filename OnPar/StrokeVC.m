//
//  StrokeVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "StrokeVC.h"

@interface StrokeVC ()

@end

@implementation StrokeVC

@synthesize intendedLocationButton;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setIntendedLocationButton:nil];
    [super viewDidUnload];
}
- (IBAction)startStroke:(id)sender {
    NSLog(@"User clicked Start Stroke");
    
    UIAlertView *alert =[[UIAlertView alloc]
                         initWithTitle:@"Are you ready to hit the ball?"
                         message:@"Press YES when you are at the ball's current location"
                         delegate:self
                         cancelButtonTitle:@"NO"
                         otherButtonTitles:@"YES", nil];
    [alert show];
    
    [intendedLocationButton setEnabled:YES];
}

- (IBAction)endStroke:(id)sender {
    NSLog(@"User clicked End Stroke");
    
    UIAlertView *alert =[[UIAlertView alloc]
                         initWithTitle:@"Are you ready to end this shot?"
                         message:@"Only answer when you are at the ball's current location"
                         delegate:self
                        cancelButtonTitle:@"NO"
                         otherButtonTitles:@"YES", nil];
    [alert show];
}
@end
