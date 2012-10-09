//
//  StrokeVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrokeVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *intendedLocationButton;

- (IBAction)startStroke:(id)sender;
- (IBAction)endStroke:(id)sender;


@end
