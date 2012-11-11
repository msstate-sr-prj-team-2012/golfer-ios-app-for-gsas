//
//  ViewController.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"ViewController appeared");
    
    [self.navigationController setNavigationBarHidden:YES];   //it hides
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        NSLog(@"ViewController loaded");
    
	// Do any additional setup after loading the view, typically from a nib.
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:102/255.0f green:0/255.0f blue:0/255.0f alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (IBAction)beginButton:(id)sender {
    NSLog(@"Button press: 'Click Here To Begin'");
}

@end
