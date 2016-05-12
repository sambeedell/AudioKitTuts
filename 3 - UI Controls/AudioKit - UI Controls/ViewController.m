//
//  ViewController.m
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This class control everything that is presented to the user on the storyboard file. It also uses AudioKit to generate an audible tone with UI controls that affect the frequency and ampltiude parameters of the tone
//
//  ------------------------------------------------------------------------

#import "ViewController.h"

@implementation ViewController
{
    NewInstrument *newInstrument; // This is the AKInstrument subclass declaration
    // STEP 6
    IBOutlet AKPropertySlider *frequencySlider;
    IBOutlet AKPropertySlider *amplitudeSlider;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    newInstrument = [[NewInstrument alloc] init]; // Here we are allocating memory for the AKInstrument subclass and intialising it.
    [AKOrchestra addInstrument:newInstrument]; // This line adds the declared AudioKit instruments to the AKOrchestra

    // STEP 7
    // Connect the UISliders to the AKInstrumentProperty objects
    frequencySlider.property = newInstrument.freq;
    amplitudeSlider.property = newInstrument.amp;
}

// This function is triggered by the button on the storyboard file. When the user presses the button an audible tone is heard and the button updates its text to display the action performed by the next click.
- (IBAction)toggleSound:(UIButton *)sender {
    if (![sender.titleLabel.text isEqual: @"Stop"]) {
        // Play the instrument
        [newInstrument play];
        // Change the text of the UIButton
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
    } else {
        // Stop the instrument
        [newInstrument stop];
        // Change the text of the UIButton
        [sender setTitle:@"Play Sine Wave" forState:UIControlStateNormal];
    }
}

@end
