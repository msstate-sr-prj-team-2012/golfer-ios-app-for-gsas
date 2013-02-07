//
//  GolfersVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface GolfersVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    NSMutableArray *golfers;
	NSString *golferName;
}

@property (strong, nonatomic) IBOutlet UITableView *golferTableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)editOrder:(id)sender;
- (IBAction)addButton:(id)sender;

@end
