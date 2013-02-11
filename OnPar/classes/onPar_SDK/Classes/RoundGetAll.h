//
//  RoundGetAll.h
//  OnPar
//
//  Created by Kevin R Benton on 2/11/13.
//  Copyright (c) 2013 Mississippi State. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Round.h"
#import "Request.h"

@interface RoundGetAll : NSObject

@property (nonatomic, retain) NSMutableArray *rounds;
@property (nonatomic)         NSNumber       *nextPage;
@property (nonatomic)         NSNumber       *userID;
@property (nonatomic, copy)   NSString       *path;

- (id) init: (NSNumber *) data;
- (void) next;

@end
