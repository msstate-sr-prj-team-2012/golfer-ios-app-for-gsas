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

- (IBAction)saveSettings:(id)sender {
    // Save settings
    
    // Return to Previous Screen
    [self.navigationController popViewControllerAnimated:YES];
}
@end
