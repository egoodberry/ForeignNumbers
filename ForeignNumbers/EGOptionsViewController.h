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

@property (nonatomic, strong) EGVoice *voice;
@property (nonatomic, strong) EGNumberGenerator *numberGenerator;
@property (nonatomic, strong) NSArray *voices;

@property (nonatomic, strong) IBOutlet UIPickerView *languagePicker;
@property (strong, nonatomic) IBOutlet UISlider *maximumSlider;
@property (strong, nonatomic) IBOutlet UILabel *maximumLabel;

- (IBAction)maximumChanged:(id)sender;

@end