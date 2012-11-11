//
//  dataManager.h
//  OnPar
//
//  Created by Chad Galloway on 11/9/12.
//  Copyright (c) 2012 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataManager : NSObject{
    
    NSMutableArray *golfersInOrder;
    NSMutableDictionary *roundInfo;
    NSMutableDictionary *golfer0;
    NSMutableDictionary *golfer1;
    NSMutableDictionary *golfer2;
    NSMutableDictionary *golfer3;
}



@property (nonatomic, retain) NSMutableArray *golfers;

@property (nonatomic, retain) NSMutableDictionary *roundInfo;
@property (nonatomic, retain) NSMutableDictionary *golfer0;
@property (nonatomic, retain) NSMutableDictionary *golfer1;
@property (nonatomic, retain) NSMutableDictionary *golfer2;
@property (nonatomic, retain) NSMutableDictionary *golfer3;

+ (id)myDataManager;

@end
