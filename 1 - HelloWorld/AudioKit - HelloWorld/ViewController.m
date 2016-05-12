//
//  ViewController.m
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This class control everything that is presented to the user on the storyboard file. It also uses AudioKit to generate an audible tone
//
//  ------------------------------------------------------------------------

#import "ViewController.h"

@implementation ViewController
{
    NewInstrument *newInstrument; // The AKInstrument subclass declaration
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Allocate memory for the AKInstrument subclass and run its 'init' method.
    newInstrument = [[NewInstrument alloc] init];
    
    // Add the declared AudioKit instrument(s) to the AKOrchestra which is the environment for all instruments
    // More importantly, this sets up the Csound implementation where all the low level code required to set up the audio engine is done (but neatly hidden away)
    [AKOrchestra addInstrument:newInstrument];

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
        [sender setTitle:@"Play Sine Wave at 440Hz" forState:UIControlStateNormal];
    }
}

@end
