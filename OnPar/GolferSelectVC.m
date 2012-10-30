//
//  GolferSelectVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolferSelectVC.h"

@interface GolferSelectVC ()

@end

@implementation GolferSelectVC
@synthesize golferName;
@synthesize golferTabBar;
@synthesize golfer0, golfer1, golfer2, golfer3;
@synthesize holeNumber, shotNumber, scoreTotal, rankNumber;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Start on first players tab
    [golferTabBar setSelectedItem:[golferTabBar.items objectAtIndex:0]];
    [self activateTab:1];
    //////////////////////////////////////////////////
    
    // Sets the correct number of tabs on the tabBar
    int golfers = 4;
    
    if(golfers < 4)
    {
        [golfer3 setEnabled:NO];
        [golfer3 setImage:nil];
        [golfer3 setTitle:nil];
    }
    if(golfers < 3)
    {
        [golfer2 setEnabled:NO];
        [golfer2 setImage:nil];
        [golfer2 setTitle:nil];
    }
    if(golfers < 2)
    {
        [golfer1 setEnabled:NO];
        [golfer1 setImage:nil];
        [golfer1 setTitle:nil];
    }
    ///////////////////////////////////////////////
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setGolferName:nil];
    [self setGolferTabBar:nil];
    [self setGolfer0:nil];
    [self setGolfer1:nil];
    [self setGolfer2:nil];
    [self setGolfer3:nil];
    [self setHoleNumber:nil];
    [self setShotNumber:nil];
    [self setScoreTotal:nil];
    [self setRankNumber:nil];
    [super viewDidUnload];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@"didSelectItem: %d", item.tag);
    
    NSInteger tabNumber = item.tag;
    
        NSLog(@"tag action here");
    
    [golferName setText:[NSString stringWithFormat:@"Golfer %d",tabNumber]];
    [holeNumber setText:[NSString stringWithFormat:@"%d",tabNumber]];
    [shotNumber setText:[NSString stringWithFormat:@"%d", tabNumber]];
    [scoreTotal setText:[NSString stringWithFormat:@"%d", tabNumber]];
    [rankNumber setText:[NSString stringWithFormat:@"%d", tabNumber]];
}

- (void)activateTab:(int)index {
    switch (index) {
        case 1:
            [self tabBar:golferTabBar didSelectItem: golfer0];
             break;
        case 2:
            [self tabBar:golferTabBar didSelectItem: golfer1];
            break;
        case 3:
            [self tabBar:golferTabBar didSelectItem: golfer2];
            break;
        case 4:
            [self tabBar:golferTabBar didSelectItem: golfer3];
            break;
        default:
            break;
    }
}

@end
