//
//  CreateTicketVC.h
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateTicketVC : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPickerView * problemTypePicker;
@property (nonatomic, strong) IBOutlet UITextField *meterNumTF;
@property (nonatomic, strong) IBOutlet UITextField *systemTypeTF;
@property (nonatomic, strong) IBOutlet UITextField *componentTypeTF;
@property (nonatomic, strong) IBOutlet UISegmentedControl *priorityStatusSC;
@property (nonatomic, strong) IBOutlet UITextView *notesTV;
@property (nonatomic, strong) IBOutlet UITextField *problemCodeTF;

@end
