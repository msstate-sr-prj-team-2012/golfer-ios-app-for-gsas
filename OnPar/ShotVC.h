//
//  ShotVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotVC : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollV;

@property (strong, nonatomic) IBOutlet UIImageView *imageV;

- (IBAction)tapDetected:(UIGestureRecognizer*)recognizer;

- (IBAction)saveIntendedDirection:(id)sender;

@end
