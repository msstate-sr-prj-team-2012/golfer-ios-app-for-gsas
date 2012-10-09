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

@implementation ClubSelectionVC


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
    [self populateClubTypes];
    [self populateClubNumbers];
    [self populateWedgeTypes];
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

- (void)populateClubTypes
{
    
    clubType = [[NSMutableArray alloc] init];
    [clubType addObject:@" Iron "];
    [clubType addObject:@" Wood "];
    [clubType addObject:@" Hybrid "];
    [clubType addObject:@" Wedge "];
    
}

- (void)populateClubNumbers
{
    clubNum = [[NSMutableArray alloc] init];
    [clubNum addObject:@" 1 "];
    [clubNum addObject:@" 2 "];
    [clubNum addObject:@" 3 "];
    [clubNum addObject:@" 4 "];
    [clubNum addObject:@" 5 "];
    [clubNum addObject:@" 6 "];
    [clubNum addObject:@" 7 "];
    [clubNum addObject:@" 8 "];
    [clubNum addObject:@" 9 "];
    
}

- (void)populateWedgeTypes;
{
    wedgeType = [[NSMutableArray alloc] init];
    [wedgeType addObject:@" Gap "];
    [wedgeType addObject:@" Lob "];
    [wedgeType addObject:@" Pitching "];
    [wedgeType addObject:@" Sand "];
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
    else if (component == CLUBNUMBER)
        return [clubNum count];
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == CLUBTYPE)
        return [clubType objectAtIndex:row];
    else if (component == CLUBNUMBER)
        return [clubNum objectAtIndex:row];
    else
        return 0;
}



 @end
