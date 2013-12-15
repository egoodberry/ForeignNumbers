//
//  EGNumberGenerator.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGNumberGenerator : NSObject

@property (nonatomic) int maximum;

-(NSString*) generate;

@end