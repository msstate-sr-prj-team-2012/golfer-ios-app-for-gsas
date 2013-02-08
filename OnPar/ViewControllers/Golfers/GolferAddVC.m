//
//  GolferAddVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/8/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "GolferAddVC.h"

@interface GolferAddVC ()

@end

@implementation GolferAddVC{
    NSDictionary *teeDict;
    dataManager *myDataManager;
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"GolferAddVC has appeared");
    
    // get shared data
    myDataManager = [dataManager myDataManager];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"GolferAddVC has loaded");
    
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
    NSString *golferTee = [NSString stringWithFormat:@"%i", [teeSelectionPicker selectedRowInComponent:0]+1];
    NSMutableArray *holes = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *golferInfo = [[NSMutableDictionary alloc] init];
    
    [golferInfo setValue:golferID forKey:@"golferID"];
    [golferInfo setValue:golferName forKey:@"golferName"];
    [golferInfo setValue:golferTee forKey:@"golferTee"];
    [golferInfo setObject:holes forKey:@"holes"];
    
    [myDataManager.golfers addObject:golferInfo];
    
    User *u = [[User alloc] construct: [NSNumber numberWithInt: [golferID intValue]]];
    [myDataManager addUser: u];
    [myDataManager startRoundForUser: u teeID: 3];
    
    NSLog(@"Round: %@", [[myDataManager roundForUserWithID: u.ID] export]);
        
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
    
    [teeKey addObject: [NSString stringWithFormat: @"%i", (int) AGGIES]];
    [teeKey addObject: [NSString stringWithFormat: @"%i", (int) MAROONS]];
    [teeKey addObject: [NSString stringWithFormat: @"%i", (int) COWBELLS]];
    [teeKey addObject: [NSString stringWithFormat: @"%i", (int) TIPS]];
    
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
    {       NSString *id = [NSString stringWithFormat:@"%i",row+1];
            return [teeDict objectForKey:id];
    }else
        return 0;
}


@end
