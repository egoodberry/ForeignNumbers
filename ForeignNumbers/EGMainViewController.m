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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:[
    [UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
    [[UIBarButtonItem alloc] initWithTitle: @"Apply" style: UIBarButtonSystemItemDone target:self action:@selector(doneWithNumberPad)],
    nil
    ];
    [numberToolbar sizeToFit];
    self.answerInput.inputAccessoryView = numberToolbar;
}

- (void) cancelNumberPad {
    self.answerInput.text = @"";
    [self.answerInput resignFirstResponder];
}

- (void) doneWithNumberPad {
    [self submit];
}

- (IBAction)newNumberPressed {
    _currentAnswer = [_numberGenerator generate];
    [_voice speak: _currentAnswer];
    self.repeatButton.enabled = true;
    self.answerInput.enabled = true;
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

- (IBAction)answerChanged:(id)sender {
    NSString *answer = [((UITextField*)sender) text];
    if ([answer isEqualToString: @""]) {
        self.submitButton.enabled = false;
    }
    else {
        self.submitButton.enabled = true;
    }
}

- (IBAction)submitPressed:(id)sender {
    [self submit];
}

- (void) submit {
    NSString *answer = [self.answerInput text];
    UIAlertView* alert = [[UIAlertView alloc] init];
    
    if ([answer isEqualToString: _currentAnswer]) {
        alert.title = @"YES!";
        alert.message = @"Correct!";
        [alert addButtonWithTitle: @"Another!"];
    }
    else {
        alert.title = @"No.";
        alert.message = @"Incorrect.";
        [alert addButtonWithTitle: @"Try again!"];
    }
    
    [alert show];
    [self.answerInput resignFirstResponder];
}

@end