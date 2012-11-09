//
//  SarNotesVC.m
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SarNotesVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"

@interface SarNotesVC ()

@end

@implementation SarNotesVC

@synthesize notesLabel = _notesLabel;
@synthesize sarInfo = _sarInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Notes";
        self.tabBarItem.image = [UIImage imageNamed:@"notes.png"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.notesLabel.text = [self.sarInfo valueForKey:NOTES];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UtilityClass dismissKeyboard];
}

@end
