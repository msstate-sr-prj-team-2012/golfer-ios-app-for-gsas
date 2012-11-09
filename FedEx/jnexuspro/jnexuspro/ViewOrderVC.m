//
//  ViewOrderVC.m
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewOrderVC.h"
#import "UtilityClass.h"
#import "NexusModel.h"
#import "WebViewVC.h"
#import "AppDelegate.h"

@interface ViewOrderVC ()

@end

@implementation ViewOrderVC

@synthesize orderInfo = _orderInfo;
@synthesize meterNumberLabel = _meterNumberLabel;
@synthesize partNumberLabel = _partNumberLabel;
@synthesize businessNameLabel = _businessNameLabel;
@synthesize trackingNumberButton = _trackingNumberButton;
@synthesize statusLabel = _statusLabel;
@synthesize quantityLabel = _quantityLabel;
@synthesize dateOrderedLablel = _dateOrderedLablel;
@synthesize descriptionLabel = _descriptionLabel;


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
    self.title = [NSString stringWithFormat:@"Order #%@", [self.orderInfo valueForKey:ORDER_NUM]];
    self.meterNumberLabel.text = [self.orderInfo valueForKey:METER_NUMBER];
    self.partNumberLabel.text = [self.orderInfo valueForKey:PART_NUMBER];
    self.businessNameLabel.text = [self.orderInfo valueForKey:BUSINESS_NAME];
    self.statusLabel.text = [self.orderInfo valueForKey:ORDER_STATUS];
    self.quantityLabel.text = [self.orderInfo valueForKey:QUANTITY];
    self.dateOrderedLablel.text = [self.orderInfo valueForKey:ORDER_DATE];
    self.descriptionLabel.text = [self.orderInfo valueForKey:PART_DESCRIPTION];
    
    [self.trackingNumberButton setTitle:[self.orderInfo valueForKey:ORDER_TRACKING_NUM] forState:UIControlStateNormal];
}

- (void) viewWillAppear:(BOOL)animated
{
    if ([[self.orderInfo valueForKey:ORDER_STATUS] isEqualToString:ORDER_SHIPPED_STATUS])
    {
        self.trackingNumberButton.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.trackingNumberButton.titleLabel.textColor = [UIColor blueColor];
        self.trackingNumberButton.titleLabel.textAlignment = UITextAlignmentLeft;

    }
    else {
        self.trackingNumberButton.enabled = NO;
    }
}

- (IBAction) openMap
{
    NSString *address = self.trackingNumberButton.titleLabel.text;
    NSString *url = [NSString stringWithFormat:@"http://www.fedex.com/Tracking?tracknumber_list=1&track_number_replace_0=1&track_number_0=%@", address];
    NSLog(@"Opening Web URL: %@", url);
    url = [url stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    WebViewVC *view = [[WebViewVC alloc] initWithNibName:@"WebViewVC" bundle:nil];
    view.webURL = url;
    view.title = @"Part Tracking";
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate.navigationController pushViewController:view animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
