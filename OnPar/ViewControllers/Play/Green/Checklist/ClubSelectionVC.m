//
//  ClubSelectionVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ClubSelectionVC.h"

@interface ClubSelectionVC ()

@end

@implementation ClubSelectionVC{
    dataManager *myDataManager;
    int selectedClubType;
    int selectedClubNumber;
    NSString *selectedClub;
}

@synthesize clubLabel;

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
    
    // get shared data
    myDataManager = [dataManager myDataManager];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self populateClubArrays];
}

- (void)viewDidUnload
{
    [self setClubLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Loading Arrays

- (void)populateClubArrays
{
    clubType = [[NSMutableArray alloc] init];
    [clubType addObject:@" Wood "];
    [clubType addObject:@" Hybrid "];
    [clubType addObject:@" Iron "];
    [clubType addObject:@" Wedge "];
    
    woodNum = [[NSMutableArray alloc] init];
    [woodNum addObject:@" Driver "];
    [woodNum addObject:@" 3 "];
    [woodNum addObject:@" 4 "];
    [woodNum addObject:@" 5 "];
    [woodNum addObject:@" 7 "];
    [woodNum addObject:@" 9 "];
    
    hybridNum = [[NSMutableArray alloc] init];
    [hybridNum addObject:@" 2 "];
    [hybridNum addObject:@" 3 "];
    [hybridNum addObject:@" 4 "];
    [hybridNum addObject:@" 5 "];
    [hybridNum addObject:@" 6 "];

    ironNum = [[NSMutableArray alloc] init];
    [ironNum addObject:@" 2 "];
    [ironNum addObject:@" 3 "];
    [ironNum addObject:@" 4 "];
    [ironNum addObject:@" 5 "];
    [ironNum addObject:@" 6 "];
    [ironNum addObject:@" 7 "];
    [ironNum addObject:@" 8 "];
    [ironNum addObject:@" 9 "];
    
    wedgeType = [[NSMutableArray alloc] init];
    [wedgeType addObject:@" Approach "];
    [wedgeType addObject:@" High Lob "];
    [wedgeType addObject:@" Lob "];
    [wedgeType addObject:@" Pitching "];
    [wedgeType addObject:@" Sand "];
}

- (IBAction)saveClubSelection:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == CLUBTYPE)
        return [clubType count];
    else if (component == CLUBNUMBER && selectedClubType == 0)
        return [woodNum count];
    else if (component == CLUBNUMBER && selectedClubType == 1)
        return [hybridNum count];
    else if (component == CLUBNUMBER && selectedClubType == 2)
        return [ironNum count];
    else if (component == CLUBNUMBER && selectedClubType == 3)
        return [wedgeType count];
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   /* if (component == CLUBTYPE)
        return [clubType objectAtIndex:row];
    else if (component == CLUBNUMBER)
        return [clubNum objectAtIndex:row];
    else
        return 0;
    */
    if (component == CLUBTYPE)
        return [clubType objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedClubType == 0)
        return [woodNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedClubType == 1)
        return [hybridNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedClubType == 2)
        return [ironNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedClubType == 3)
        return [wedgeType objectAtIndex:row];
    else
        return 0;
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedClubType = [pickerView selectedRowInComponent:CLUBTYPE];
    
    selectedClubNumber = [pickerView selectedRowInComponent:CLUBNUMBER];
    
    NSLog(@" %i %i selected", selectedClubType, selectedClubNumber);
    
    if (component == CLUBTYPE && !(selectedClubType < 0)) {
        [pickerView reloadComponent:CLUBNUMBER];
        //[pickerView selectRow:0 inComponent:CLUBNUMBER animated:YES];
    }
    
    [self reloadClubLabelforType: selectedClubType andNum: selectedClubNumber];
}


- (void) reloadClubLabelforType: (int) type andNum: (int) num {
    
    // CHANGE LABEL
    switch (type)
    {
            // WOOD
        case 0:
            switch (num)
            {
                // DRIVER
                case 0:
                    selectedClub = @"WD";
                    [clubLabel setText: @"Wood Driver"];
                    break;
                // 3
                case 1:
                    selectedClub = @"W3";
                    [clubLabel setText: @"3 Wood"];
                    break;
                // 4
                case 2:
                    selectedClub = @"W4";
                    [clubLabel setText: @"4 Wood"];
                    break;
                // 5
                case 3:
                    selectedClub = @"W5";
                    [clubLabel setText: @"5 Wood"];
                    break;
                // 7
                case 4:
                    selectedClub = @"W7";
                    [clubLabel setText: @"7 Wood"];
                    break;
                // 9
                case 5:
                    selectedClub = @"W9";
                    [clubLabel setText: @"9 Wood"];
                    break;
            }
            
            break;
            
            
        // HYBRID
        case 1:
            switch (selectedClubNumber)
            {
                // 2
                case 0:
                    selectedClub = @"H2";
                    [clubLabel setText: @"2 Hybrid"];
                    break;
                // 3
                case 1:
                    selectedClub = @"H3";
                    [clubLabel setText: @"3 Hybrid"];
                    break;
                // 4
                case 2:
                    selectedClub = @"H4";
                    [clubLabel setText: @"4 Hybrid"];
                    break;
                // 5
                case 3:
                    selectedClub = @"H5";
                    [clubLabel setText: @"5 Hybrid"];
                    break;
                // 6
                case 4:
                    selectedClub = @"H6";
                    [clubLabel setText: @"6 Hybrid"];
                    break;
            }
            
            break;
            
        // IRON
        case 2:
            switch (selectedClubNumber)
            {
                // 2
                case 0:
                    selectedClub = @"I2";
                    [clubLabel setText: @"2 Iron"];
                    break;
                // 3
                case 1:
                    selectedClub = @"I3";
                    [clubLabel setText: @"3 Iron"];
                    break;
                // 4
                case 2:
                    selectedClub = @"I4";
                    [clubLabel setText: @"4 Iron"];
                    break;
                // 5
                case 3:
                    selectedClub = @"I5";
                    [clubLabel setText: @"5 Iron"];
                    break;
                // 6
                case 4:
                    selectedClub = @"I6";
                    [clubLabel setText: @"6 Iron"];
                    break;
                // 7
                case 5:
                    selectedClub = @"I7";
                    [clubLabel setText: @"7 Iron"];
                    break;
                // 8
                case 6:
                    selectedClub = @"I8";
                    [clubLabel setText: @"8 Iron"];
                    break;
                // 9
                case 7:
                    selectedClub = @"I9";
                    [clubLabel setText: @"9 Iron"];
                    break;
            }
            
            break;
            
        // WEDGE
        case 3:
            switch (selectedClubNumber)
            {
                case 0:
                    selectedClub = @"WA";
                    [clubLabel setText: @"Approach Wedge"];
                    break;
                case 1:
                    selectedClub = @"WH";
                    [clubLabel setText: @"High Lob Wedge"];
                    break;
                case 2:
                    selectedClub = @"WL";
                    [clubLabel setText: @"Lob Wedge"];
                    break;
                case 3:
                    selectedClub = @"WP";
                    [clubLabel setText: @"Pitching Wedge"];
                    break;
                case 4:
                    selectedClub = @"WS";
                    [clubLabel setText: @"Sand Wedge"];
                    break;
            }
            
            break;
    }
}

 @end
