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

- (void)speak: (NSString*)speech;

@end