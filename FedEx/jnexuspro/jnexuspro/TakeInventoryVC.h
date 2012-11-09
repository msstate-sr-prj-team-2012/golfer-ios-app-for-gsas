//
//  TakeInventoryVC.h
//  jnexuspro
//
//  Created by C S on 8/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeInventoryVC : UIViewController
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *partsArray;
@property (nonatomic, strong) NSMutableDictionary *partsDict;
@property (nonatomic, strong) NSString* meterNum;
- (IBAction) addPart;
@end
