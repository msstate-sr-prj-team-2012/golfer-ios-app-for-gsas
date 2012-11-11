//
//  ShotVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ShotVC.h"

@interface ShotVC ()

@end

@implementation ShotVC{
    double x, y;
    double lat, lon;
}

@synthesize scrollV, imageV, doneButton;


/*
- (void) loadView {

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;

    UIImage *image = [UIImage imageNamed:@"GolfCourse.png"];
    imageV = [[UIImageView alloc] initWithImage:image];
    //imageV.contentMode = UIViewContentModeScaleAspectFit;
    //imageV.userInteractionEnabled = YES;
    
    //[imageV addGestureRecognizer:tapGesture];
    
    //CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    scrollV = [[UIScrollView alloc] initWithFrame:imageV.frame];
    scrollV.contentSize = CGSizeMake(imageV.frame.size.width, imageV.frame.size.height);
    
    [scrollV addGestureRecognizer:tapGesture];
    
    [scrollV addSubview:imageV];
    scrollV.userInteractionEnabled = YES;
    scrollV.maximumZoomScale = 5;
    scrollV.minimumZoomScale = 0.5;
    scrollV.bounces = NO;
    scrollV.bouncesZoom = NO;
    
    self.view = scrollV;

    
}
*/


-(void)tapDetected:(UIGestureRecognizer*)recognizer{
    NSLog(@"tap detected.");
    CGPoint point = [recognizer locationInView:imageV];
    
    NSLog(@"x = %f y = %f", point.x, point.y );
    
    x = point.x;
    y = point.y;
    
    // should place image on top of hole pic to indicate selection here //
    
    [doneButton setEnabled:YES];
}


- (IBAction)saveIntendedDirection:(id)sender {
    
    dataManager *myDataManager = [dataManager myDataManager];
    
    // should be converted to actual gps location
    lat = x;
    lon = y;
    
    // get selected golfer
    int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
    
    // add gps location to current shot dictionary
    [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%f",lat] forKey:@"aimLatitude"];

    [[[myDataManager.golfers objectAtIndex:selectedGolfer] objectForKey:@"currentShot"] setValue:[NSString stringWithFormat:@"%f",lon] forKey:@"aimLongitude"];
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [[self.view subviews] objectAtIndex:0];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"ShotVC has appeared");
    
    //dataManager *myDataManager = [dataManager myDataManager];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"ShotVC has loaded");
    
    dataManager *myDataManager = [dataManager myDataManager];
    
    // get current golfer
    int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
    
    // get current shot number
    int shot = [[[myDataManager.golfers objectAtIndex:selectedGolfer] valueForKey:@"shotCount"] intValue];
    
    NSLog(@"current shot number: %i", shot);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload {
    [self setScrollV:nil];
    [self setImageV:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
}


@end