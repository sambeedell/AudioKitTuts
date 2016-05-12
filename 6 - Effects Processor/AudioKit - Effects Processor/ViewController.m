//
//  ViewController.m
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description: This file contains all of the UI processes and nothing else.
//
//
//  ------------------------------------------------------------------------

#import "ViewController.h"
#import "AKPropertySlider.h"

@implementation ViewController
{
    Conductor *conductor;
    BOOL isPlaying;
    
    IBOutlet AKPropertySlider *amplitudeSlider;
    IBOutlet AKPropertySlider *feedbackSlider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialise the Conductor object
    conductor = [[Conductor alloc] init];
    
    // Connect the UISliders to the AKInstrumentProperties
    feedbackSlider.property = conductor->instrument.freq;
    amplitudeSlider.property = conductor->instrument.amp;
}


// This function is triggered by the button on the storyboard file. When the user presses the button an audible tone is heard and the button updates its text to display the action performed by the next click.
- (IBAction)keyPressed:(UIButton *)sender {
    
    if (!isPlaying) {
        // Tell the conductor to play the instrument
        [conductor play];
        // Update button label
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        // Update boolean value
        isPlaying = YES;
    } else {
        // Tell the conductor to stop the instrument
        [conductor stop];
        // Update the button label
        [sender setTitle:@"Play" forState:UIControlStateNormal];
        // Update boolean value
        isPlaying = NO;
    }
}

@end
