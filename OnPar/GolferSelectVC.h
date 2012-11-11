//
//  GolferSelectVC.h
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dataManager.h"

@interface GolferSelectVC : UIViewController <UITabBarDelegate>{
    NSMutableArray *golfersInOrder;
    NSMutableDictionary *golferInfo;
    int golferCount;
}

@property (weak, nonatomic) IBOutlet UILabel *golferName;

@property (strong, nonatomic) IBOutlet UILabel *holeNumber;
@property (strong, nonatomic) IBOutlet UILabel *shotNumber;
@property (strong, nonatomic) IBOutlet UILabel *scoreTotal;
@property (strong, nonatomic) IBOutlet UILabel *rankNumber;

@property (strong, nonatomic) IBOutlet UITabBar *golferTabBar;

@property (strong, nonatomic) IBOutlet UITabBarItem *golfer0;
@property (strong, nonatomic) IBOutlet UITabBarItem *golfer1;
@property (strong, nonatomic) IBOutlet UITabBarItem *golfer2;
@property (strong, nonatomic) IBOutlet UITabBarItem *golfer3;

- (IBAction)goToGreen:(id)sender;

@end
