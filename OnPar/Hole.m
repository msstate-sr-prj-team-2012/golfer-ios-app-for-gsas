//
//  Hole.m
//  OnPar
//
//  Created by Chad Galloway on 11/11/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "Hole.h"

@implementation Hole

@synthesize holeNum, GIR, FIR, completed;
@synthesize shots, currentShot;




- (id)init {
    if (self = [super init]) {
        // initialize data here
        shots = [[NSMutableArray alloc] init];
        currentShot = nil;
    }
    
    return self;
}

@end
