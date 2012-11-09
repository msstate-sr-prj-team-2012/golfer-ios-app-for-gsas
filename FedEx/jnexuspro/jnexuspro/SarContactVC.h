//
//  SarContactVC.h
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SarContactVC : UIViewController

@property (strong, nonatomic) NSMutableDictionary *sarInfo;

@property (strong, nonatomic) IBOutlet UILabel *accountNumLabel;
@property (strong, nonatomic) IBOutlet UILabel *businessNameLabel;

@property (strong, nonatomic) IBOutlet UIButton *addressLabel;

@property (strong, nonatomic) IBOutlet UITextView *addressL1Label;
@property (strong, nonatomic) IBOutlet UILabel *addressL2Label;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;
@property (strong, nonatomic) IBOutlet UILabel *zipLabel;
@property (strong, nonatomic) IBOutlet UILabel *contactNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *contactNumberLabel;

@end
