//
//  RegistrationVC.h
//  OnPar2
//
//  Created by Chad Galloway on 2/14/13.
//  Copyright (c) 2013 Chad Galloway. All rights reserved.
//

//#import <UIKit/UIKit.h>
//#import "Config.h"

@interface Golfer_Registration_VC : UIViewController

@property (strong, nonatomic) IBOutlet SLGlowingTextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet SLGlowingTextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet SLGlowingTextField *emailAddressTextField;
@property (strong, nonatomic) IBOutlet SLGlowingTextField *membershipNumberTextField;
@property (strong, nonatomic) IBOutlet SLGlowingTextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *teeSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *handSegment;
@property (strong, nonatomic) IBOutlet SLGlowingTextField *birthdateTextField;
@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *registrationView;


- (IBAction)done:(id)sender;
- (IBAction)teeChanged:(id)sender;
- (IBAction)handChanged:(id)sender;
- (IBAction)genderChanged:(id)sender;


@end
