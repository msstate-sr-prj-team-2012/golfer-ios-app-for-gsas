//
//  AddPartVC.h
//  jnexuspro
//
//  Created by Apple on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPartVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *scanSerialValue;
@property (weak, nonatomic) NSString *meterNum;

@property (weak, nonatomic) IBOutlet UILabel *partLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialLabel;
@property (weak, nonatomic) IBOutlet UITextView *descLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *submitPartButton;
@property (strong, nonatomic) UIAlertView *scanAlert;

@property BOOL takingInventory;

- (IBAction) returnToInventory;
- (IBAction) verifySerialNumber;
- (IBAction) scanSerialNumber;
- (IBAction) addToInventory;

@end
