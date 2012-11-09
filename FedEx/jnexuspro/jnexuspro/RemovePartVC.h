//
//  RemovePartVC.h
//  jnexuspro
//
//  Created by Apple on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemovePartVC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *airbillNumber;
@property (nonatomic, strong) IBOutlet UITextField *dmtNumber;
@property (nonatomic, strong) NSDictionary *partInfo;

- (IBAction) removePart;

@end
