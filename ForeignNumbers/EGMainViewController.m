//
//  EGMainViewController.m
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import "EGMainViewController.h"
#import "EGOptionsViewController.h"

@implementation EGMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _voice = [[EGVoice alloc] init];
        _numberGenerator = [[EGNumberGenerator alloc] init];
    }
    return self;
}

- (IBAction)newNumberPressed {
    _currentAnswer = [_numberGenerator generate];
    [_voice speak: _currentAnswer];
    self.repeatButton.enabled = true;
}

- (IBAction)repeatPressed {
    [_voice speak: _currentAnswer];
}

- (IBAction)optionsPressed {
    EGOptionsViewController *optionsViewController = [[EGOptionsViewController alloc] initWithNibName:@"EGOptionsViewController" bundle:[NSBundle mainBundle]];
    [optionsViewController.navigationItem setTitle: @"Options"];
    optionsViewController.numberGenerator = _numberGenerator;
    optionsViewController.voice = _voice;
    [self.navigationController pushViewController:optionsViewController animated:YES];
}

@end