//
//  PuttingVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/30/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "PuttingVC.h"

@interface PuttingVC ()

@end

@implementation PuttingVC

@synthesize numberOfPutts;

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

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.numberOfPutts) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)dismissKeyboard {
    [numberOfPutts resignFirstResponder];
}

- (IBAction)savePuttingInfo:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setNumberOfPutts:nil];
    [super viewDidUnload];
}
@end
