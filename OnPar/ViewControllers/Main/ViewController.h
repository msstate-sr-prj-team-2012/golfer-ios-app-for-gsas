//
//  ViewController.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPair.h"
#import "LLPair.h"

@interface ViewController : UIViewController

- (IBAction)beginButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;

@end