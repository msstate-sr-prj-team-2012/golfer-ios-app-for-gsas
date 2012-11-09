//
//  SarNotesVC.h
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SarNotesVC : UIViewController


@property (strong, nonatomic) NSMutableDictionary *sarInfo;

@property (strong, nonatomic) IBOutlet UITextView *notesLabel;

@end
