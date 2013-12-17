//
//  EGMainViewController.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGVoice.h"
#import "EGNumberGenerator.h"

@interface EGMainViewController : UIViewController {
    EGVoice *_voice;
    EGNumberGenerator *_numberGenerator;
    NSString *_currentAnswer;
}

@property (strong, nonatomic) IBOutlet UIButton *repeatButton;

- (IBAction)newNumberPressed;
- (IBAction)repeatPressed;
- (IBAction)optionsPressed;

@end