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
    
    // get golfer info
    golfers = [[NSMutableArray alloc] init];
	NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	[db1 open];
	FMResultSet *fResult1= [db1 executeQuery:@"SELECT * FROM golfer"];
    
	while([fResult1 next])
	{
		name = [fResult1 stringForColumn:@"golfer_name"];
		[golfers addObject:name];
	}
    
    NSLog(@"golfer count tab page: %d", [golfers count]);
    
	[db1 close];
    
    // image to use on tabs
    UIImage *man = [UIImage imageNamed:@"man.png"];
    
    // Sets the correct number of tabs on the tabBar
    if([golfers count] > 0)
    {
        [golfer0 setImage:man];
        [golfer0 setTitle:[golfers objectAtIndex:0]];
        [golfer0 setEnabled:YES];
        
        if([golfers count] > 1)
        {
            [golfer1 setImage:man];
            [golfer1 setTitle:[golfers objectAtIndex:1]];
            [golfer1 setEnabled:YES];
            
            if([golfers count] > 2)
            {
                [golfer2 setImage:man];
                [golfer2 setTitle:[golfers objectAtIndex:2]];
                [golfer2 setEnabled:YES];
                
                if([golfers count] > 3)
                {
                    [golfer3 setImage:man];
                    [golfer3 setTitle:[golfers objectAtIndex:3]];
                    [golfer3 setEnabled:YES];
                }
            }
        }
    }
    
    // Start on first players tab
    if ([golfers count] > 0){
        [golferTabBar setSelectedItem:[golferTabBar.items objectAtIndex:0]];
        [self activateTab:1];
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
    NSLog(@"didSelectItem: %d", item.tag);
    
    NSInteger tabNumber = item.tag;
    
        NSLog(@"Tab %d Loaded", tabNumber);
    
    [golferName setText:[NSString stringWithFormat:@"%@",[golfers objectAtIndex:tabNumber]]];
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
