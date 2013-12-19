//
//  EGUserDefaults.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/18/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import "EGUserDefaults.h"

NSString* LanguageKey = @"EG:lang";
NSString* SpeedKey = @"EG:speed";
NSString* MaximumKey = @"EG:maximum";

@implementation EGUserDefaults

+ (NSString*)language {
    NSString *userDefault = [[NSUserDefaults standardUserDefaults] stringForKey:LanguageKey];
    if (userDefault == nil) {
        return @"fr-FR";
    }
    else {
        return userDefault;
    }
}

+ (void)setLanguage: (NSString*)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:language forKey:LanguageKey];
    [userDefaults synchronize];
}

+ (float)speed {
    float userDefault = [[NSUserDefaults standardUserDefaults] floatForKey:SpeedKey];
    if (userDefault == 0) {
        return 0.5f;
    }
    else {
        return userDefault;
    }
}

+ (void)setSpeed: (float)speed {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:speed forKey:SpeedKey];
    [userDefaults synchronize];
}

+ (int)maximum {
    int userDefault = [[NSUserDefaults standardUserDefaults] integerForKey:MaximumKey];
    if (userDefault == 0) {
        return 1000;
    }
    else {
        return userDefault;
    }
}

+ (void)setMaximum: (int)maximum {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:maximum forKey:MaximumKey];
    [userDefaults synchronize];
}

@end