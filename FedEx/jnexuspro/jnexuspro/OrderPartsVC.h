//
//  OrderPartsVC.h
//  jnexuspro
//
//  Created by Apple on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderPartsVC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *partNumberTF;
@property (nonatomic, strong) IBOutlet UITextField *quantityTF;
@property (nonatomic, strong) IBOutlet UIPickerView *partPicker;

- (IBAction) order;

@end
