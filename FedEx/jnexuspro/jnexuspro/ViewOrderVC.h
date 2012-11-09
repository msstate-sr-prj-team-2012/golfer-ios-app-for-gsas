//
//  ViewOrderVC.h
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewOrderVC : UIViewController

@property (nonatomic, strong) NSMutableDictionary *orderInfo;
@property (nonatomic, strong) IBOutlet UILabel *meterNumberLabel;
@property (nonatomic, strong) IBOutlet UILabel *partNumberLabel;
@property (nonatomic, strong) IBOutlet UILabel *quantityLabel;
@property (nonatomic, strong) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UILabel *dateOrderedLablel;
@property (nonatomic, strong) IBOutlet UILabel *statusLabel;
@property (nonatomic, strong) IBOutlet UIButton *trackingNumberButton;
@property (nonatomic, strong) IBOutlet UILabel *businessNameLabel;
@end
