//
//  dataManager.m
//  OnPar
//
//  Created by Chad Galloway on 11/9/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import "dataManager.h"

@implementation dataManager

@synthesize golfers;
@synthesize golfer0, golfer1, golfer2, golfer3;
@synthesize roundInfo;

#pragma mark Singleton Methods

+ (id)myDataManager {
    static dataManager *myDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myDataManager = [[self alloc] init];
    });
    return myDataManager;
}

- (id)init {
    if (self = [super init]) {
        // initialize data here
        golfers = [[NSMutableArray alloc] init];
        roundInfo = [[NSMutableDictionary alloc] init];
        golfer0 = [[NSMutableDictionary alloc] init];
        golfer1 = [[NSMutableDictionary alloc] init];
        golfer2 = [[NSMutableDictionary alloc] init];
        golfer3 = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end