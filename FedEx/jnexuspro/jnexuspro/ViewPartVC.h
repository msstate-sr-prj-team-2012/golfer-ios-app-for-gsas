//
//  ViewPartVC.h
//  jnexuspro
//
//  Created by Apple on 7/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPartVC : UIViewController

@property (nonatomic, strong) NSMutableDictionary *partInfo;
@property (nonatomic, strong) IBOutlet UITextView *infoTextView;
@property (nonatomic, strong) IBOutlet UILabel *serialNumTF;
@property (nonatomic, strong) IBOutlet UILabel *partNumTF;
@property (nonatomic, strong) IBOutlet UILabel *meterNumTF;
@property (nonatomic, strong) IBOutlet UILabel *inventoryDateTF;
@property (nonatomic, strong) IBOutlet UILabel *airbillNumTF;
@property (nonatomic, strong) IBOutlet UILabel *dmtNumTF;
@property (nonatomic, strong) IBOutlet UILabel *descriptionTF;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *removePartButton;
- (IBAction)reportLostStolen;

- (IBAction) addToVan;

@end
