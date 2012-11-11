//
//  ShotOptionVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface ShotOptionVC : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableViewCell *nrButton;
@property (strong, nonatomic) IBOutlet UITableViewCell *cancelButton;


@end
