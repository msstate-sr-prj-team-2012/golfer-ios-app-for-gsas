//
//  PuttingVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/30/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface PuttingVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *numberOfPutts;

- (IBAction)savePuttingInfo:(id)sender;

@end
