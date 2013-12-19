//
//  EGNumberGenerator.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import "EGNumberGenerator.h"
#import "EGUserDefaults.h"

@implementation EGNumberGenerator

-(id) init {
    if (self = [super init]) {
        _maximum = [EGUserDefaults maximum];
    }
    return self;
}

-(NSString*) generate {
    return [NSString stringWithFormat:@"%d", arc4random_uniform(self.maximum)];
}

@end