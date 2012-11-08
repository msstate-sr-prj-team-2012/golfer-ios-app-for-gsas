//
//  ShotSequenceVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShotSequenceVC : UITableViewController<UITableViewDelegate>

- (IBAction)changeGolfer:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *intendedDirection;
@property (strong, nonatomic) IBOutlet UITableViewCell *clubSelection;
@property (strong, nonatomic) IBOutlet UITableViewCell *hitTheBall;
@property (strong, nonatomic) IBOutlet UITableViewCell *penaltyOptions;
@property (strong, nonatomic) IBOutlet UITableViewCell *endShot;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end