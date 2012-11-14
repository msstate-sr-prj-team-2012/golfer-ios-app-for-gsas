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

@implementation GolferSelectVC{
    NSInteger tabNumber;
}

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


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"GolferSelectVC has appeared");
    
    // hide back button
    self.navigationItem.hidesBackButton = YES;
    
    // get shared data
    dataManager *myDataManager = [dataManager myDataManager];
    
    
    // get selected golfer
    int selectedGolfer = [[myDataManager.roundInfo valueForKey:@"selectedGolfer"] intValue];
    
    
    // Start on first golfers tab
    if ([myDataManager.golfers count] > 0){
        [golferTabBar setSelectedItem:[golferTabBar.items objectAtIndex: selectedGolfer]];
        NSLog(@"selectedGolfer is %i", selectedGolfer);
        [self activateTab:selectedGolfer + 1];
    }

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"GolferSelectVC has loaded");
    
    // getting shared data
    dataManager *myDataManager = [dataManager myDataManager];
    
    // image to use on tabs
    UIImage *man = [UIImage imageNamed:@"man.png"];
        
    // Sets the correct number of tabs on the tabBar
    if([myDataManager.golfers count] > 0)
    {
        [golfer0 setImage:man];
        [golfer0 setTitle:[[myDataManager.golfers objectAtIndex:0]valueForKey:@"golferName"]];
        [golfer0 setEnabled:YES];
        
        if([myDataManager.golfers count] > 1)
        {
            [golfer1 setImage:man];
            [golfer1 setTitle:[[myDataManager.golfers objectAtIndex:1]valueForKey:@"golferName"]];
            [golfer1 setEnabled:YES];
            
            if([myDataManager.golfers count] > 2)
            {
                [golfer2 setImage:man];
                [golfer2 setTitle:[[myDataManager.golfers objectAtIndex:2]valueForKey:@"golferName"]];
                [golfer2 setEnabled:YES];
                
                if([myDataManager.golfers count] > 3)
                {
                    [golfer3 setImage:man];
                    [golfer3 setTitle:[[myDataManager.golfers objectAtIndex:3]valueForKey:@"golferName"]];
                    [golfer3 setEnabled:YES];
                }
            }
        }
    }
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

    dataManager *myDataManager = [dataManager myDataManager];
    
    tabNumber = item.tag;
    NSLog(@"Tab %i Selected", tabNumber);
    
    // update name
    [golferName setText:[NSString stringWithFormat:@"%@",[[myDataManager.golfers objectAtIndex:tabNumber] valueForKey:@"golferName"]]];
    
    // get current hole number for golfer
    int holeNum = [[[[myDataManager.golfers objectAtIndex:tabNumber] valueForKey:@"currentHole"] valueForKey:@"holeNum"] intValue];

    // get current shot number for golfer
    int shotNum = [[[myDataManager.golfers objectAtIndex:tabNumber] valueForKey:@"shotCount"] intValue];
    
    NSLog(@"shot count updated to %i", shotNum);
    
    
    // update labels
    [holeNumber setText:[NSString stringWithFormat:@"%i", holeNum]];
    [shotNumber setText:[NSString stringWithFormat:@"%i", shotNum]];
    //[scoreTotal setText:[NSString stringWithFormat:@"%d", tabNumber]];
    //[rankNumber setText:[NSString stringWithFormat:@"%d", tabNumber]];
}


- (void)activateTab:(int)index {
    switch (index) {
        case 1:
            [self tabBar:golferTabBar didSelectItem: golfer0];
            NSLog(@"Tab 0 activated");
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


- (IBAction)goToGreen:(id)sender {
    dataManager *myDataManager = [dataManager myDataManager];
    
    // save which golfer is selected
    [myDataManager.roundInfo setValue: [NSString stringWithFormat:@"%i", tabNumber] forKey:@"selectedGolfer"];
    
    [self performSegueWithIdentifier:@"toShotStart" sender:nil];
}


@end
