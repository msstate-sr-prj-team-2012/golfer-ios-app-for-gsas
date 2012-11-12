//
//  OptionsVC.h
//  OnPar
//
//  Created by Chad Galloway on 11/11/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface OptionsVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *startLatitude;
@property (strong, nonatomic) IBOutlet UILabel *startLongitude;

@property (strong, nonatomic) IBOutlet UILabel *aimLatitude;
@property (strong, nonatomic) IBOutlet UILabel *aimLongitude;

@property (strong, nonatomic) IBOutlet UILabel *endLatitude;
@property (strong, nonatomic) IBOutlet UILabel *endLongitude;

@end
