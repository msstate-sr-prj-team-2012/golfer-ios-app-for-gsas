//
//  OptionsVC.m
//  OnPar
//
//  Created by Chad Galloway on 11/11/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "OptionsVC.h"

@interface OptionsVC ()

@end

@implementation OptionsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.hidesBackButton = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSLog(@"OptionsVC loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
- (IBAction)UploadButton:(id)sender {
    dataManager *myDataManager = [dataManager myDataManager];
    [myDataManager uploadRounds];
}
@end
