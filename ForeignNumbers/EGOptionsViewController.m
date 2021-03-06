//
//  EGOptionsViewController.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <AVFoundation/AVSpeechSynthesis.h>
#import "EGOptionsViewController.h"
#import "EGUserDefaults.h"
#import "EGNumberGenerator.h"
#import "EGVoice.h"

@implementation EGOptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _voices = [AVSpeechSynthesisVoice speechVoices];
    [self selectCurrentLanguage];
    [self setCurrentMaximum];
    [self setSpeed];
}

- (void)selectCurrentLanguage {
    [self.languagePicker reloadAllComponents];
    AVSpeechSynthesisVoice *selectedVoice = [_voices objectAtIndex:[_voices indexOfObjectPassingTest:^BOOL(AVSpeechSynthesisVoice *obj, NSUInteger index, BOOL *stop) {
        return [obj.language isEqualToString: _voice.language];
    }]];
    int languageIndex = [_voices indexOfObject: selectedVoice];
    [self.languagePicker selectRow:languageIndex inComponent:0 animated: YES];
}

- (void)setCurrentMaximum {
    [self.maximumSlider setValue: _numberGenerator.maximum];
    [self updateMaximumLabel];
}

- (void)updateMaximumLabel {
    [self.maximumLabel setText: [[NSString alloc] initWithFormat: @"%i", _numberGenerator.maximum]];
}

- (void)setSpeed {
   [self.speedSlider setValue: _voice.speed];
}

- (IBAction)maximumChanged:(UISlider*)slider {
    int maximum = (int) [slider value];
    self.numberGenerator.maximum = maximum;
    [self updateMaximumLabel];
    [EGUserDefaults setMaximum: maximum];
}

- (IBAction)speedChanged:(UISlider*)slider {
    float speed = [slider value];
    self.voice.speed = speed;
    [EGUserDefaults setSpeed:speed];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _voices.count;
}

- (NSString*)pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    AVSpeechSynthesisVoice *voice = _voices[row];
    return [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value: voice.language];
}

- (void)pickerView:(UIPickerView*)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    AVSpeechSynthesisVoice *voice = _voices[row];
    _voice.language = voice.language;
    [EGUserDefaults setLanguage: voice.language];
}

@end