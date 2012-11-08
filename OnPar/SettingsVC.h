//
//  SettingsVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/26/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface SettingsVC : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *startingHoleTextField;

- (IBAction)saveSettings:(id)sender;

@end
