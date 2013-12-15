//
//  EGVoice.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import "EGVoice.h"
#import <AVFoundation/AVSpeechSynthesis.h>

@implementation EGVoice

- (id) init {
    if (self = [super init]) {
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
    }
    return self;
}

- (void)speak: (NSString*)speech {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString: speech];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage: @"fr-FR"];
    [_synthesizer speakUtterance: utterance];
}

@end