//
//  SarDetailsVC.h
//  jnexuspro
//
//  Created by C S on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SarDetailsVC : UIViewController

@property (strong, nonatomic) NSMutableDictionary *sarInfo;
@property (strong, nonatomic) NSString *sarNum;

@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;
@property (strong, nonatomic) IBOutlet UILabel *priorityStatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *expirationLabel;
@property (strong, nonatomic) IBOutlet UILabel *sarStatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *resolutionDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *problemTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *componentTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *problemDetailLabel;
@property (strong, nonatomic) IBOutlet UILabel *systemTypeLabel;

@end
