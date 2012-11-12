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

@synthesize startLatitude, startLongitude;
@synthesize aimLatitude, aimLongitude;
@synthesize endLatitude, endLongitude;

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
    
    NSLog(@"OptionsVC loaded");
    
    dataManager *myDataManager = [dataManager myDataManager];
    
    int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
    
    startLatitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"startLatitude"];

    startLongitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"startLongitude"];

    aimLatitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"aimLatitude"];

    aimLongitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"aimLongitude"];

    endLatitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"endLatitude"];

    endLongitude.text = [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] valueForKey:@"endLongitude"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setStartLatitude:nil];
    [self setStartLongitude:nil];
    [self setAimLatitude:nil];
    [self setAimLongitude:nil];
    [self setEndLatitude:nil];
    [self setEndLongitude:nil];
    [super viewDidUnload];
}
@end
