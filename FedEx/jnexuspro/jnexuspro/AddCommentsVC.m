//
//  AddCommentsVC.m
//  jnexuspro
//
//  Created by Apple on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddCommentsVC.h"
#import "AppDelegate.h"
#import "NexusModel.h"

NSString *currentSar;

@interface AddCommentsVC ()

@end

@implementation AddCommentsVC
@synthesize commentTextView = _commentTextView;
@synthesize scrollView = _scrollView;

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
    self.title = @"Edit Comments";
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = save;
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    currentSar = [delegate.userInfo valueForKey:@"currentSar"];
    NSMutableDictionary *sarInfo = [[delegate.userInfo objectForKey:@"sars"] objectForKey:currentSar];
    self.commentTextView.text = [sarInfo valueForKey:COMMENTS];    // Do any additional setup after loading the view from its nib.

    //self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    //self.scrollView.bouncesZoom = YES;
    //self.scrollView.delegate = self;
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *2);
    //[self.view addSubview:self.scrollView];
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

- (IBAction) save
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [self.view addSubview:delegate.activityIndicator];
    [UtilityClass showActivityIndicator];
    [self performSelector:@selector(doSave) withObject:nil afterDelay:0.01];
}

- (void) doSave;
{
    NSMutableDictionary *dict = [NexusModel saveComment:self.commentTextView.text ForSar:currentSar];
    [UtilityClass hideActivityIndicator];
    if (dict == nil)
    {
        //failure
    }
    else
    {
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        NSMutableDictionary *sars = [[delegate.userInfo objectForKey:@"sars"] mutableCopy];
        NSMutableDictionary *sarInfo = [[sars objectForKey:currentSar] mutableCopy];
        [sarInfo setObject:self.commentTextView.text forKey:COMMENTS];
        [sars setObject:sarInfo forKey:currentSar];
        [delegate.userInfo setObject:sars forKey:@"sars"];
        [delegate.navigationController popViewControllerAnimated:YES];
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event  
{
    [UtilityClass dismissKeyboard];
}

@end
