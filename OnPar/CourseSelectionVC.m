//
//  CourseSelectionVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "CourseSelectionVC.h"
#import "dataManager.h"

@interface CourseSelectionVC ()

@end

@implementation CourseSelectionVC{
    dataManager *myDataManager;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"CourseSelectionVC has appeared");
    
    // get shared data
    myDataManager = [dataManager myDataManager];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"CourseSelectionVC has loaded");
    
	// Do any additional setup after loading the view.
    [self getCourses];
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
    courseIDs = [[NSMutableArray alloc] init];
    
    NSArray *courses = [Course getAll];
    for (Course *c in courses) {
        [courseNames addObject: c.name];
        [courseIDs addObject: c.ID];
    }
    
    // once results have all been added to arrays
    courseDict = [NSDictionary dictionaryWithObjects:courseIDs forKeys:courseNames];
}


- (IBAction)saveSelection:(id)sender {
    
    // Save Course Selection
    selectedCourseName = [courseNames objectAtIndex:[courseSelectionPicker selectedRowInComponent:0]];

    selectedCourseID = [courseDict objectForKey:selectedCourseName];
    int ID = [selectedCourseID intValue];
    
    [myDataManager.roundInfo setValue:selectedCourseName forKey:@"courseName"];
    [myDataManager.roundInfo setValue:selectedCourseID forKey:@"courseID"];
    
    myDataManager._course = [[Course alloc] construct: [NSNumber numberWithInt: ID]];
    NSLog(@"Selected Course: %@", [[myDataManager course] export]);
    
    
/*
    // Insert course_id into DB
    NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	if(![db1 open])
        NSLog(@"database could not open");

    BOOL success = [db1 executeUpdate:@"INSERT INTO info (course_id) VALUES (?)", selectedCourseID];
    
	// Closing the Database
	[db1 close];
    
    // debugging
     if(success)
         NSLog(@"success");
     else
         NSLog(@"failure");
*/
    
    // push new view on nav controller
    [self performSegueWithIdentifier:@"courseToGolfer" sender:nil];
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
