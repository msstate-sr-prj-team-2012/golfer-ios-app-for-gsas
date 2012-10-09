//
//  GolferChangeVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolferChangeVC.h"

@interface GolferChangeVC ()

@end

@implementation GolferChangeVC

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
    [self populateGolfers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    golferSelectionPicker = nil;
    [super viewDidUnload];
}

#pragma mark - Loading Arrays

- (void)populateGolfers
{
    golfers = [[NSMutableArray alloc] init];
    [golfers addObject:@" Chad "];
    [golfers addObject:@" Travis "];
    [golfers addObject:@" Kevin "];
    [golfers addObject:@" Braden "];
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == GOLFER)
        return [golfers count];
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == GOLFER)
        return [golfers objectAtIndex:row];
    else
        return 0;
}

@end
