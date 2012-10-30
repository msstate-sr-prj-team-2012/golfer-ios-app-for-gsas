//
//  CourseSelectionVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "CourseSelectionVC.h"

@interface CourseSelectionVC ()

@end

@implementation CourseSelectionVC

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
    [self populateCourses];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Loading Arrays

- (void)populateCourses
{
    courses = [[NSMutableArray alloc] init];
    [courses addObject:@" Mississippi State University "];
}

- (IBAction)saveCourseSelection:(id)sender {
    // Save Golfer Info
    
    
    // Return to Previous View
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return [courses count];
    else
        return 0;
 }

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [courses objectAtIndex:row];
    else
        return 0;
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
