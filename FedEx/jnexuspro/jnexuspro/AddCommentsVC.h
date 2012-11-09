//
//  AddCommentsVC.h
//  jnexuspro
//
//  Created by Apple on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCommentsVC : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UITextView *commentTextView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;


- (IBAction) save;

@end
