//
//  Hole.h
//  OnPar
//
//  Created by Chad Galloway on 11/11/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hole : NSObject{
    
    NSNumber *holeNum;
    NSNumber *GIR;
    NSNumber *FIR;
    NSNumber *completed;
    NSMutableArray *shots;
    NSMutableDictionary *currentShot;
}

@property (nonatomic, retain) NSNumber *holeNum;

@property (nonatomic, retain) NSNumber *GIR;

@property (nonatomic, retain) NSNumber *FIR;

@property (nonatomic, retain) NSNumber *completed;

@property (nonatomic, retain) NSMutableArray *shots;

@property (nonatomic, retain) NSMutableDictionary *currentShot;

@end