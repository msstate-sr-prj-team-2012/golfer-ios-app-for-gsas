//
//  ShotVC.m
//  OnPar
//
//  Created by Chad Galloway on 10/28/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "ShotVC.h"

@interface ShotVC ()

@end

@implementation ShotVC

@synthesize scrollV, imageV;

/*
- (void) loadView {

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;

    UIImage *image = [UIImage imageNamed:@"GolfCourse.png"];
    imageV = [[UIImageView alloc] initWithImage:image];
    //imageV.contentMode = UIViewContentModeScaleAspectFit;
    //imageV.userInteractionEnabled = YES;
    
    //[imageV addGestureRecognizer:tapGesture];
    
    //CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
    scrollV = [[UIScrollView alloc] initWithFrame:imageV.frame];
    scrollV.contentSize = CGSizeMake(imageV.frame.size.width, imageV.frame.size.height);
    
    [scrollV addGestureRecognizer:tapGesture];
    
    [scrollV addSubview:imageV];
    scrollV.userInteractionEnabled = YES;
    scrollV.maximumZoomScale = 5;
    scrollV.minimumZoomScale = 0.5;
    scrollV.bounces = NO;
    scrollV.bouncesZoom = NO;
    
    self.view = scrollV;

    
}
*/

-(void)tapDetected:(UIGestureRecognizer*)recognizer{
    NSLog(@"tap detected.");
    CGPoint point = [recognizer locationInView:imageV];
    
    NSLog(@"x = %f y = %f", point.x, point.y );
}

- (IBAction)saveIntendedDirection:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [[self.view subviews] objectAtIndex:0];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScrollV:nil];
    [self setImageV:nil];
    [super viewDidUnload];
}

@end