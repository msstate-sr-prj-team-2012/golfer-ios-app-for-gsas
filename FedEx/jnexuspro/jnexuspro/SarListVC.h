//
//  SarListVC.h
//  jnexuspro
//
//  Created by C S on 7/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SarListVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *sarTableView;
@property (strong, nonatomic) NSMutableArray *sarList;

@property (strong, nonatomic) SarDetailsVC *detailsViewController;

- (void) refresh;

@end
