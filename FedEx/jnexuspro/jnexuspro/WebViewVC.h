//
//  WebViewVC.h
//  jnexuspro
//
//  Created by Apple on 8/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewVC : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSString *webURL;
@property (nonatomic, strong) NSString *pageTitle;

@end
