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
    int selectedIndex;
}


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
    [self populateClubArrays];
}

- (void)viewDidUnload
{
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
    else if (component == CLUBNUMBER && selectedIndex == 0)
        return [woodNum count];
    else if (component == CLUBNUMBER && selectedIndex == 1)
        return [hybridNum count];
    else if (component == CLUBNUMBER && selectedIndex == 2)
        return [ironNum count];
    else if (component == CLUBNUMBER && selectedIndex == 3)
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
    else if (component == CLUBNUMBER && selectedIndex == 0)
        return [woodNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedIndex == 1)
        return [hybridNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedIndex == 2)
        return [ironNum objectAtIndex:row];
    else if (component == CLUBNUMBER && selectedIndex == 3)
        return [wedgeType objectAtIndex:row];
    else
        return 0;
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedIndex = [pickerView selectedRowInComponent:0];
    if (component == 0 && !(selectedIndex < 0)) {
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
}

 @end
