//
//  EGOptionsViewController.h
//  ForeignNumbers
//
//  Created by Evan Goodberry on 12/15/13.
//  Copyright (c) 2013 Evan Goodberry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EGVoice;
@class EGNumberGenerator;

@interface EGOptionsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) EGVoice *voice;
@property (strong, nonatomic) EGNumberGenerator *numberGenerator;
@property (strong, nonatomic) NSArray *voices;

@property (strong, nonatomic) IBOutlet UIPickerView *languagePicker;
@property (strong, nonatomic) IBOutlet UISlider *maximumSlider;
@property (strong, nonatomic) IBOutlet UILabel *maximumLabel;
@property (strong, nonatomic) IBOutlet UISlider *speedSlider;

- (IBAction)maximumChanged:(id)sender;
- (IBAction)speedChanged:(id)sender;

@end