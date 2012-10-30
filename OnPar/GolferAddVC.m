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

@implementation GolferAddVC

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
    
    [self populateTees];
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
    
    
    // Return to Previous View
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dismissKeyboard {
    [golferNickname resignFirstResponder];
    [golferIdTextField resignFirstResponder];
}

#pragma mark - Loading Arrays

- (void)populateTees
{
    tees = [[NSMutableArray alloc] init];
    [tees addObject:@" Beginner "];
    [tees addObject:@" Intermediate "];
    [tees addObject:@" Advanced "];
    [tees addObject:@" Professional "];
}

#pragma mark - UIPickerView methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0)
        return [tees count];
    else
        return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [tees objectAtIndex:row];
    else
        return 0;
}


@end
