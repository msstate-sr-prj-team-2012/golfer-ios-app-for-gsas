//
//  PenaltyVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "PenaltyVC.h"

@interface PenaltyVC ()

@end

@implementation PenaltyVC

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

- (IBAction)outOfBounds:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)waterHazard:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
