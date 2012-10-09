//
//  GolferAddVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GolferAddVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *golferNickname;
@property (weak, nonatomic) IBOutlet UISegmentedControl *memberControl;
@property (weak, nonatomic) IBOutlet UILabel *golferIdLabel;
@property (weak, nonatomic) IBOutlet UITextField *golferIdTextField;

- (IBAction)memberControlChanged:(id)sender;


@end
