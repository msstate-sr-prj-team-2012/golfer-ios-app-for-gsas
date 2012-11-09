//
//  ViewInventoryVC.h
//  jnexuspro
//
//  Created by Apple on 7/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewInventoryVC : UIViewController

- (IBAction)addPart;
- (IBAction)takeInventory;
@property (nonatomic, strong) IBOutlet UITableView *inventoryTable;
@property (nonatomic, strong) NSString *meterNum;
@property (nonatomic, strong) NSMutableDictionary *meterInventory;
@property (nonatomic, strong) NSMutableArray *serialNums;
@end
