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
        _language = @"fr-FR";
        _speed = 0.5f;
    }
    return self;
}

- (void)speak: (NSString*)speech {
    NSLog(@"%@", speech);
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString: speech];
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage: _language];
    utterance.rate = _speed;
    [_synthesizer speakUtterance: utterance];
}

@end