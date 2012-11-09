//
//  TransferTicketVC.h
//  jnexuspro
//
//  Created by Apple on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransferTicketVC : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *transferTechIdTF;

@property (nonatomic, strong) IBOutlet UIPickerView *techPicker;
@property (nonatomic, strong) NSDictionary *techDictionary;

@end
