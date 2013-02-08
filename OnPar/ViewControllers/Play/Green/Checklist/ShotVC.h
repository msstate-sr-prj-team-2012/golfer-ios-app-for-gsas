//
//  ShotVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"
#import "LLPair.h"
#import "XYPair.h"

@interface ShotVC : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollV;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)tapDetected:(UIGestureRecognizer*)recognizer;

- (IBAction)saveIntendedDirection:(id)sender;

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView;

- (LLPair*)calculateAimLLWithAimXY: (XYPair*)aimXY;


#pragma mark - Coordinate Conversions
- (XYPair*)convertXY0toXY1WithXYPair: (XYPair*)xy andHeight: (double)height;
- (XYPair*)convertXY1toXY2WithXYPair: (XYPair*)xy andAngle: (double)angle;


#pragma mark - Angle of Rotation
- (double)angleOfRotationUsingTeeXY: (XYPair*)teeXY1 andTeeLL: (LLPair*)teeLLRad andCenterXY: (XYPair*)centerXY1 andCenterLL: (LLPair*)centerLLRad;


#pragma mark - Trig Angle Identities
- (double)sinPixelUsingPoint1: (XYPair*)point1 andPoint2: (XYPair*)point2;
- (double)cosPixelUsingPoint1: (XYPair*)point1 andPoint2: (XYPair*)point2;
- (double)sinGPSUsingPoint1: (LLPair*)point1 andPoint2: (LLPair*)point2;
- (double)cosGPSUsingPoint1: (LLPair*)point1 andPoint2: (LLPair*)point2;


#pragma mark - Trig Double Angle Identities
- (double)sinLLplusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY;
- (double)sinLLminusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY;
- (double)cosLLplusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY;
- (double)cosLLminusXYUsingSinLL: (double)sinLL andCosLL: (double)cosLL andSinXY: (double)sinXY andCosXY: (double)cosXY;


#pragma mark - Scaling
- (XYPair*)getFlatEarthScaleUsingTeeXY: (XYPair*)teeXY2 andTeeLLRadFlat: (XYPair*)teeLLRadFlat andCenterXY: (XYPair*)centerXY2 andCenterLLRadFlat: (XYPair*)centerLLRadFlat;


#pragma mark - Get Aim LL
- (LLPair*)getAimLLUsingAimXY: (XYPair*)aimXY2 andCenterXY: (XYPair*)centerXY2 andCenterLLRadFlat: (XYPair*)centerLLRadFlat andScaleFactors: (XYPair*) scaleFactors;

@end
