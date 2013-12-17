//
//  EGVoice.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AVSpeechSynthesizer;

@interface EGVoice : NSObject {
    AVSpeechSynthesizer* _synthesizer;
}

@property (strong, nonatomic) NSString* language;
@property (nonatomic) float speed;

- (void)speak: (NSString*)speech;

@end