//
//  GolferAddVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolferAddVC.h"
#import "AppDelegate.h"
#import "FMDatabase.h"


@interface GolferAddVC ()

@end

@implementation GolferAddVC{
    NSDictionary *teeDict;
}

@synthesize golferNickname;
@synthesize golferIdTextField;

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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    [self populateTeeDictionary];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.golferIdTextField) {
        [theTextField resignFirstResponder];
    } else if (theTextField == self.golferNickname) {
        [self.golferIdTextField becomeFirstResponder];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setGolferNickname:nil];
    [self setGolferIdTextField:nil];
    [super viewDidUnload];
}

- (IBAction)saveGolferInfo:(id)sender {
    
    // Save Golfer Info
    NSString *golferID = golferIdTextField.text;
    NSString *golferName = golferNickname.text;
    
    NSInteger golferTee = [teeSelectionPicker selectedRowInComponent:0]+1;
    
    // Insert Golfer into DB
    NSString *path1  = [[NSBundle mainBundle] pathForResource:@"OnPar" ofType:@"sqlite"];
	FMDatabase *db1  = [[FMDatabase alloc] initWithPath:path1];
	if(![db1 open])
        NSLog(@"database could not open");
    
    NSNumber *tee = [NSNumber numberWithInt:golferTee];
    
    BOOL success = [db1 executeUpdate:@"INSERT INTO golfer (golfer_id, golfer_name, golfer_tee) VALUES (?, ?, ?)", golferID, golferName, tee];
    
    NSLog(@"database is here: %@", path1);
	
	/* Closing the Database */
	[db1 close];
    
    if(success)
        NSLog(@"success");
    else
        NSLog(@"failure");
    
    // Return to Previous View
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dismissKeyboard {
    [golferNickname resignFirstResponder];
    [golferIdTextField resignFirstResponder];
}

#pragma mark - Preparing Dictionary of Tees

- (void)populateTeeDictionary
{
    // download tee names here and populate this array
    
    NSMutableArray *teeKey = [[NSMutableArray alloc]init];
    NSMutableArray *teeValue = [[NSMutableArray alloc] init];
    [teeValue addObject:@" Aggies "];
    [teeValue addObject:@" Maroons "];
    [teeValue addObject:@" Cowbells "];
    [teeValue addObject:@" Tips "];
    
    for (int i=1; i<=[teeValue count]; i++)
    {
        NSString *id = [NSString stringWithFormat:@"%d",i];
        [teeKey addObject:id];
    }
    
    teeDict = [[NSDictionary alloc]initWithObjects:teeValue forKeys:teeKey];
    
    for(id key in teeDict)
        NSLog(@"key=%@ value=%@", key, [teeDict objectForKey:key]);
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return [teeDict count];
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {       NSString *id = [NSString stringWithFormat:@"%d",row+1];
            return [teeDict objectForKey:id];
    }else
        return 0;
}

@end
