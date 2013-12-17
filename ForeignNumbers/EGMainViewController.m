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
    
    [self buildNumberToolbar];
}

- (void)cancelNumberPad {
    [self clearAnswer];
    [self.answerInput resignFirstResponder];
}

- (IBAction)newNumberPressed {
    [self speakNewNumber];
    self.repeatButton.enabled = true;
    self.giveUpButton.enabled = true;
    self.answerInput.enabled = true;
}

- (IBAction)repeatPressed {
    [self speakCurrentAnswer];
}

- (IBAction)giveUpPressed {
    UIAlertView* alert = [[UIAlertView alloc] init];
    alert.title = @"You gave up!";
    alert.message = [[NSString alloc] initWithFormat: @"The correct answer was %@.", _currentAnswer];
    [alert addButtonWithTitle: @"Well, I'm embarrassed."];
    [alert show];
    
    [self resetForm];
}

- (IBAction)optionsPressed {
    EGOptionsViewController *optionsViewController = [[EGOptionsViewController alloc] initWithNibName:@"EGOptionsViewController" bundle:[NSBundle mainBundle]];
    [optionsViewController.navigationItem setTitle: @"Options"];
    optionsViewController.numberGenerator = _numberGenerator;
    optionsViewController.voice = _voice;
    [self.navigationController pushViewController:optionsViewController animated:YES];
}

- (IBAction)submitPressed:(id)sender {
    [self submitAnswer];
}

- (void)submitAnswer {
    NSString *answer = [self.answerInput text];
    UIAlertView* alert = [UIAlertView alloc];

    if ([answer isEqualToString: _currentAnswer]) {
        alert = [alert initWithTitle:@"YES!" message:@"Correct!" delegate:self cancelButtonTitle:@"Pfew. I'm done." otherButtonTitles:@"Another!", nil];
    }
    else {
        alert = [alert init];
        alert.title = @"No.";
        alert.message = @"Incorrect.";
        [alert addButtonWithTitle: @"Wait, wait, I got it!"];
    }
    
    [alert show];
    [self.answerInput resignFirstResponder];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // Another!
        [self speakNewNumber];
    }
    else {
        [self resetForm];
    }
}

- (void)buildNumberToolbar {
    UIToolbar* numberToolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 50)];
    numberToolbar.items = [NSArray arrayWithObjects:[
                                                     [UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc] initWithTitle: @"Submit" style: UIBarButtonSystemItemDone target:self action:@selector(submitAnswer)],
                           nil
                           ];
    [numberToolbar sizeToFit];
    self.answerInput.inputAccessoryView = numberToolbar;
}

- (void)speakNewNumber {
    [self clearAnswer];
    _currentAnswer = [_numberGenerator generate];
    [self speakCurrentAnswer];
}

- (void)clearAnswer {
    self.answerInput.text = @"";
}

- (void)speakCurrentAnswer {
    [_voice speak: _currentAnswer];
}

- (void)resetForm {
    self.repeatButton.enabled = false;
    self.giveUpButton.enabled = false;
    self.answerInput.enabled = false;
    [self clearAnswer];
}

@end