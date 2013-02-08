//
//  ShotVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ShotVC.h"
#import "XYPair.h"
#import "LLPair.h"

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
    
    // create xypair from aim point
    XYPair *aimXY = [[XYPair alloc] initWithX:x andY:y];
    
    // calculate aim point
    LLPair* aimLLRad = [self calculateAimLLWithAimXY: (XYPair*)aimXY];
    LLPair *aimLLDeg = [aimLLRad rad2deg];
    
    NSLog(@"aimLLRad is %@", aimLLRad);
    NSLog(@"aimLLDeg is %@", aimLLDeg);
    
    lat = aimLLDeg._lat;
    lon = aimLLDeg._lon;
    
    // should place image on top of hole pic to indicate selection here //
    
    [doneButton setEnabled:YES];
}


- (IBAction)saveIntendedDirection:(id)sender {
    
    dataManager *myDataManager = [dataManager myDataManager];
    
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
    
    // get current hole
    int holeNum = [[[[myDataManager.golfers objectAtIndex:selectedGolfer] valueForKey:@"currentHole"] valueForKey:@"holeNum"] intValue];
    
    // get current shot number
    int shot = [[[myDataManager.golfers objectAtIndex:selectedGolfer] valueForKey:@"shotCount"] intValue];
    
    NSLog(@"current shot number: %i", shot);
    
    // TESTING
    // dynamically changing pic for hole
    NSString *hole = @"hole";
    NSString *num  = [NSString stringWithFormat:@"%d", holeNum];
    NSString *ext  = @".png";
    
    NSString *holePic = [NSString stringWithFormat: @"%@%@%@", hole, num, ext];
    
    UIImage *image = [UIImage imageNamed:holePic];
        [imageV setImage: image];
        imageV.frame =CGRectMake(imageV.frame.origin.x, imageV.frame.origin.y, image.size.width,image.size.height);
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


#pragma mark - Calculate Aim LL

- (LLPair*)calculateAimLLWithAimXY: (XYPair*)aimXY{
    
    // retrieve known points for this hole
    XYPair *teeXY0 = [[XYPair alloc] initWithX:94 andY:472];
    LLPair *teeLLDeg = [[LLPair alloc] initWithLat:33.478658 andLon:-88.733421];
    LLPair *teeLLRad = [[LLPair alloc] initWithLLPair:[teeLLDeg deg2rad]];
    XYPair *teeLLRadFlat = [[XYPair alloc] initWithX:teeLLRad._lon andY:teeLLRad._lat];
    NSLog(@"FlatTee is %@", teeLLRadFlat);
    
    XYPair *centerXY0 = [[XYPair alloc] initWithX:87 andY:197];
    LLPair *centerLLDeg = [[LLPair alloc] initWithLat:33.48124 andLon:-88.734538];
    LLPair *centerLLRad = [[LLPair alloc] initWithLLPair:[centerLLDeg deg2rad]];
    XYPair *centerLLRadFlat = [[XYPair alloc] initWithX:centerLLRad._lon andY:centerLLRad._lat];
    NSLog(@"FlatCenter is %@", centerLLRadFlat);
    
    XYPair *aimXY0 = [[XYPair alloc] initWithXYPair:aimXY];
    LLPair *aimLLDeg = [[LLPair alloc] init];
    LLPair *aimLLRad = [[LLPair alloc] init];
    
    // Get height of image
    double height = imageV.bounds.size.height;
    NSLog(@"Height of image is: %f", height);
    
    // 1st coordinate conversion
    XYPair *teeXY1 = [self convertXY0toXY1WithXYPair:teeXY0 andHeight:height];
    XYPair *centerXY1 = [self convertXY0toXY1WithXYPair:centerXY0 andHeight:height];
    XYPair *aimXY1 = [self convertXY0toXY1WithXYPair:aimXY0 andHeight:height];
    
    // Calculate angle of rotation
    double rotation = [self angleOfRotationUsingTeeXY:teeXY1 andTeeLL:teeLLRad andCenterXY:centerXY1 andCenterLL:centerLLRad];
    
    // 2nd coordinate conversion
    XYPair *teeXY2 = [self convertXY1toXY2WithXYPair:teeXY1 andAngle:rotation];
    NSLog(@"TeeXY2 is %@", teeXY2);
    XYPair *centerXY2 = [self convertXY1toXY2WithXYPair:centerXY1 andAngle:rotation];
    NSLog(@"CenterXY2 is %@", centerXY2);
    XYPair *aimXY2 = [self convertXY1toXY2WithXYPair:aimXY1 andAngle:rotation];
    NSLog(@"AimXY2 is %@", aimXY2);
    
    // Get Flat Earth Scaling Factors
    XYPair *scaleFactors = [[XYPair alloc] initWithXYPair:[self getFlatEarthScaleUsingTeeXY:teeXY2 andTeeLLRadFlat:teeLLRadFlat andCenterXY:centerXY2 andCenterLLRadFlat:centerLLRadFlat]];
    
    NSLog(@"Scaling factors are %@", scaleFactors);
    
    // Get Aim LL
    aimLLRad = [self getAimLLUsingAimXY: (XYPair*)aimXY2 andCenterXY: (XYPair*)centerXY2 andCenterLLRadFlat: (XYPair*)centerLLRadFlat andScaleFactors: (XYPair*) scaleFactors];
    aimLLDeg = [aimLLRad rad2deg];
    
    NSLog(@"AimLLRad is %@", aimLLRad);
    NSLog(@"AimLLDeg is %@", aimLLDeg);
    
    // calculate distances to display
        // from current location to aim point
        // from aim point to center of green
        // from current location to green
    
    return aimLLRad;
}


#pragma mark - Coordinate Conversions

- (XYPair*)convertXY0toXY1WithXYPair: (XYPair*)xy andHeight: (double)height{
    
    XYPair *results = [[XYPair alloc] init];
    results._x = xy._x;
    results._y = height - xy._y;
    return results;
}

- (XYPair*)convertXY1toXY2WithXYPair: (XYPair*)xy andAngle: (double)angle{
    
    XYPair *results = [[XYPair alloc] init];
    results._x = xy._x*cos(angle) - xy._y*sin(angle);
    results._y = xy._x*sin(angle) - xy._y*cos(angle);
    return results;
}


#pragma mark - Angle of Rotation

- (double)angleOfRotationUsingTeeXY: (XYPair*)teeXY1 andTeeLL: (LLPair*)teeLLRad andCenterXY: (XYPair*)centerXY1 andCenterLL: (LLPair*)centerLLRad{
    
    // Calculate sin and cos in XY
    double sinXY = [self sinPixelUsingPoint1: (XYPair*)teeXY1 andPoint2: (XYPair*)centerXY1];
    double cosXY = [self cosPixelUsingPoint1: (XYPair*)teeXY1 andPoint2: (XYPair*)centerXY1];

    // Calculate sin and cos in LL
    double sinLL = [self sinGPSUsingPoint1:teeLLRad andPoint2:centerLLRad];
    double cosLL = [self cosGPSUsingPoint1:teeLLRad andPoint2:centerLLRad];
    
    // Calculate sin and cos of angle of rotation
    double sinRot = [self sinLLminusXYUsingSinLL:sinLL andCosLL:cosLL andSinXY:sinXY andCosXY:cosXY];
    double cosRot = [self cosLLminusXYUsingSinLL:sinLL andCosLL:cosLL andSinXY:sinXY andCosXY:cosXY];

    // Calculate angle
    double sinRotation = asin(sinRot);
    double cosRotation = acos(cosRot);
    
    // TESTING
    NSLog(@"Angle of rotation derived... ");
    NSLog(@"From SIN");
    NSLog(@"\tDegrees: %f", sinRotation*180.0/M_PI);
    NSLog(@"\tRadians: %f", sinRotation);
    NSLog(@"From COS");
    NSLog(@"\tDegrees: %f", cosRotation*180.0/M_PI);
    NSLog(@"\tRadians: %f", cosRotation);
	
    return sinRotation;
}


#pragma mark - Trig Angle Identities

- (double)sinPixelUsingPoint1: (XYPair*)point1 andPoint2: (XYPair*)point2{
    
    return [point1 distanceInY:point2] / [point1 distanceInXY:point2];
}

- (double)cosPixelUsingPoint1: (XYPair*)point1 andPoint2: (XYPair*)point2{
    
    return [point1 distanceInX:point2] / [point1 distanceInXY:point2];
}

- (double)sinGPSUsingPoint1: (LLPair*)point1 andPoint2: (LLPair*)point2{
    
    return [point1 distanceInLat:point2] / [point1 distanceInLatLon:point2];
}

- (double)cosGPSUsingPoint1: (LLPair*)point1 andPoint2: (LLPair*)point2{

    return [point1 distanceInLon:point2] / [point1 distanceInLatLon:point2];
}


#pragma mark - Trig Sum and Diff Formulas

- (double)sinLLplusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY{
    
    return sinLL*cosXY + cosLL*sinXY;
}

- (double)sinLLminusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY{

    return sinLL*cosXY - cosLL*sinXY;
}

- (double)cosLLplusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY{
    
    return cosLL*cosXY - sinLL*sinXY;
}

- (double)cosLLminusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY{
    
    return cosLL*cosXY + sinLL*sinXY;
}


#pragma mark - Scaling

- (XYPair*)getFlatEarthScaleUsingTeeXY: (XYPair*)teeXY2 andTeeLLRadFlat: (XYPair*)teeLLRadFlat andCenterXY: (XYPair*)centerXY2 andCenterLLRadFlat: (XYPair*)centerLLRadFlat{
    
    double scaleX = [teeLLRadFlat distanceInX:centerLLRadFlat] / [teeXY2 distanceInX:centerXY2];
    double scaleY = [teeLLRadFlat distanceInY:centerLLRadFlat] / [teeXY2 distanceInY:centerXY2];
    
    XYPair *results = [[XYPair alloc] init];
    results._x = scaleX;
    results._y = scaleY;
    
    NSLog(@"SFs are %@", results);
    
    return results;
}


#pragma mark - Get Aim LL
- (LLPair*)getAimLLUsingAimXY: (XYPair*)aimXY2 andCenterXY: (XYPair*)centerXY2 andCenterLLRadFlat: (XYPair*)centerLLRadFlat andScaleFactors: (XYPair*) scaleFactors{
    
    double aimLon = centerLLRadFlat._x + (aimXY2._x - centerXY2._x) * scaleFactors._x;
    NSLog(@"Aim longitude is %.8f", aimLon);
    double aimLat = centerLLRadFlat._y + (aimXY2._y - centerXY2._y) * scaleFactors._y;
    NSLog(@"Aim latitude is %.8f", aimLat);

    LLPair *results = [[LLPair alloc] init];
    results._lat = aimLat;
    results._lon = aimLon;
    return results;
}

@end