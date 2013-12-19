//
//  EGUserDefaults.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/18/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EGUserDefaults : NSObject

+ (NSString*)language;
+ (void)setLanguage: (NSString*)language;

+ (float)speed;
+ (void)setSpeed: (float)speed;

+ (int)maximum;
+ (void)setMaximum: (int)maximum;

@end