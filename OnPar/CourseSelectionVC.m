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
    [self getCourses];
    NSLog(@"view loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Loading Arrays

- (void)getCourses
{
    //here is where you would return all courses and ids
    //iterate through results
    courseNames = [[NSMutableArray alloc] init];
    [courseNames addObject:@"Mississippi State University"];
    
    courseIDs = [[NSMutableArray alloc] init];
    [courseIDs addObject:@"1"];
    ////
    
    // once results have all been added to arrays
    courseDict = [NSDictionary dictionaryWithObjects:courseIDs forKeys:courseNames];
}

- (IBAction)saveSelection:(id)sender {
    
    // Save Course Selection
    selectedCourseName = [courseNames objectAtIndex:[courseSelectionPicker selectedRowInComponent:0]];
    
    selectedCourseID = [courseDict objectForKey:selectedCourseName];
    
    // Insert course_id into DB
    NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	if(![db1 open])
        NSLog(@"database could not open");

    BOOL success = [db1 executeUpdate:@"INSERT INTO info (course_id) VALUES (?)", selectedCourseID];
    
	/* Closing the Database */
	[db1 close];
    
    // debugging
     if(success)
         NSLog(@"success");
     else
         NSLog(@"failure");
    
    // push new view on nav controller
    [self performSegueWithIdentifier:@"courseSave" sender:nil];
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return [courseDict count];
    else
        return 0;
 }

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [courseNames objectAtIndex:row];
    else
        return 0;
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

@end
