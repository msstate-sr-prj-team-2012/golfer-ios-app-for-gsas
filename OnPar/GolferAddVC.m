//
//  GolferAddVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolferAddVC.h"

@interface GolferAddVC ()

@end

@implementation GolferAddVC

@synthesize golferNickname;
@synthesize memberControl;
@synthesize golferIdLabel;
@synthesize golferIdTextField;

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
    [self setGolferNickname:nil];
    [self setMemberControl:nil];
    [self setGolferIdLabel:nil];
    [self setGolferIdTextField:nil];
    [super viewDidUnload];
}
- (IBAction)memberControlChanged:(id)sender {
    
    if(memberControl.selectedSegmentIndex == 1)
    {
        golferIdLabel.hidden = NO;
        golferIdTextField.hidden = NO;
    }
    else
    {
        golferIdLabel.hidden = YES;
        golferIdTextField.hidden = YES;
    }
}
@end
