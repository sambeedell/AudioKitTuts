//
//  ViewController.m
//  AudioKit - HelloWorld2
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This class control everything that is presented to the user on the storyboard file.
//  It also uses AudioKit to generate an audible tone and plot 6 different graphs:
//        1. Rolling Output Plot
//        2. FFT Output Plot
//        3. Oscilloscope Output Plot
//        4. Rolling Input Plot
//        5. FFT Input Plot
//        6. Oscilloscope Input Plot
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
    
    // Add the declared AudioKit instrument(s) to the AKOrchestra
    [AKOrchestra addInstrument:newInstrument];
    
    // There is no code required to set up the audio plots. All the work required is in the Interface Builder (the .storyboard file). A simple UIView must be dragged onto the UIViewController. In the Utilities section (the right sidebar) select the 'Identity Inspector' tab and select the relevant Custom Class for the UIView object.
    
    // All of AudioKit's graph plots can be found at the bottom of this page: http://audiokit.io/utilities/ 
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
