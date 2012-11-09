//
//  SarContactVC.m
//  jnexuspro
//
//  Created by C S on 7/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SarContactVC.h"
#import "NexusModel.h"
#import "WebViewVC.h"
#import "AppDelegate.h"

@interface SarContactVC ()

@end

@implementation SarContactVC

@synthesize accountNumLabel = _accountNumLabel;
@synthesize businessNameLabel = _businessNameLabel;
@synthesize addressLabel = _addressLabel;
@synthesize addressL1Label = _addressL1Label;
@synthesize addressL2Label = _addressL2Label;
@synthesize cityLabel = _cityLabel;
@synthesize stateLabel = _stateLabel;
@synthesize zipLabel = _zipLabel;
@synthesize contactNameLabel = _contactNameLabel;
@synthesize contactNumberLabel = _contactNumberLabel;
@synthesize sarInfo = _sarInfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Contact";
        self.tabBarItem.image = [UIImage imageNamed:@"contact.png"];


    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.accountNumLabel.text = [self.sarInfo valueForKey:ACCOUNT_NUM];
    self.businessNameLabel.text = [self.sarInfo valueForKey:BUSINESS_NAME];
    self.contactNumberLabel.text = [self.sarInfo valueForKey:CONTACT_NUMBER];
    self.contactNameLabel.text = [self.sarInfo valueForKey:CONTACT_NAME];
    
    NSString *str = @"";
    if (![[self.sarInfo valueForKey:ADDRESS_LINE1] isEqualToString:@""])
        str = [str stringByAppendingFormat:@"%@", [self.sarInfo valueForKey:ADDRESS_LINE1]];
    if (![[self.sarInfo valueForKey:ADDRESS_LINE2] isEqualToString:@""])
        str = [str stringByAppendingFormat:@" %@", [self.sarInfo valueForKey:ADDRESS_LINE2]];
    if (![[self.sarInfo valueForKey:CITY] isEqualToString:@""])
        str = [str stringByAppendingFormat:@", %@", [self.sarInfo valueForKey:CITY]];
    if (![[self.sarInfo valueForKey:STATE] isEqualToString:@""])
        str = [str stringByAppendingFormat:@", %@", [self.sarInfo valueForKey:STATE]];
    if (![[self.sarInfo valueForKey:ZIP] isEqualToString:@""])
        str = [str stringByAppendingFormat:@" %@", [self.sarInfo valueForKey:ZIP]];
    [self.addressLabel setTitle:str forState:UIControlStateNormal];
    self.addressLabel.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    //self.addressLabel.titleLabel.textAlignment = UITextAlignmentCenter;
    self.addressLabel.titleLabel.text = str;

    /*self.addressL1Label.text = [self.sarInfo valueForKey:ADDRESS_LINE1];
    self.addressL2Label.text = [self.sarInfo valueForKey:ADDRESS_LINE2];
    self.cityLabel.text = [self.sarInfo valueForKey:CITY];
    self.stateLabel.text = [self.sarInfo valueForKey:STATE];
    self.zipLabel.text = [self.sarInfo valueForKey:ZIP];*/
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) openMap
{
    NSString *address = self.addressLabel.titleLabel.text;
    address = [address stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    NSString *url = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", address];
    NSLog(@"Opening Map URL: %@", url);
    url = [url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];

    WebViewVC *view = [[WebViewVC alloc] initWithNibName:@"WebViewVC" bundle:nil];
    view.webURL = url;
    view.title = @"Site Mapping";
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:view animated:YES];
}

@end
