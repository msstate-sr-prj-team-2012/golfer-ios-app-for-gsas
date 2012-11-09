//
//  WebViewVC.m
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebViewVC.h"
#import "AppDelegate.h"
#import "UtilityClass.h"

@interface WebViewVC ()

@end

@implementation WebViewVC
@synthesize webView = _webView;
@synthesize webURL = _webURL;
@synthesize pageTitle = _pageTitle;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        AppDelegate *delegate =  [[UIApplication sharedApplication] delegate];
        [self.view addSubview:delegate.activityIndicator];
        [UtilityClass showActivityIndicator];
        [self performSelector:@selector(loadPage) withObject:nil afterDelay:0.01];
        self.title = self.pageTitle;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{

}

- (void) loadPage
{
    NSURL *url = [NSURL URLWithString:self.webURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [UtilityClass hideActivityIndicator];
}
@end
