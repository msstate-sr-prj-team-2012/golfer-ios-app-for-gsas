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

- (IBAction)savePuttingInfo:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
