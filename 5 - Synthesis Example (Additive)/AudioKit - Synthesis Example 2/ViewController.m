//
//  ViewController.m
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    // Instrumnet Declaration
    NewInstrument *instrument;
    
    // IBOutlet references
    IBOutlet AKPropertySlider *amplitude;
    
    // Waveform Generator objects
    AKHarmonicCosineTableGenerator *additiveCosineTable;
    AKTable *waveform;
    
    // Variables
    BOOL isPlaying;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Init the table generators
    additiveCosineTable = [[AKHarmonicCosineTableGenerator alloc] initWithNumberOfHarmonics:1 lowestHarmonic:1 partialMultiplier:0.9];
    waveform = [[AKTable alloc] init];

    // Create the 'instrument' and add it to the orchestra
    instrument = [[NewInstrument alloc] init];
    [AKOrchestra addInstrument:instrument];
    
    // Connect the UISliders to the AKInstrumentProperty objects
    amplitude.property = instrument.amp;
    
}
- (IBAction)updateHarmonics:(UIStepper *)sender {
    // Update the table generator with the correct amoutn of harmonics
    [additiveCosineTable setOptionalNumberOfHarmonics:sender.value];
//    [additiveCosineTable setOptionalPartialMultiplier:<#(float)#>];
//    [additiveCosineTable setOptionalLowestHarmonic:<#(int)#>];
    
    // Populate the AKTable variable to accomodate for the changes
    [waveform populateTableWithGenerator:additiveCosineTable];
    
    // Apply the new waveform to the instrument property
    instrument.osc.waveform = waveform;
    
    // Update the instrument in the orchestra
    [AKOrchestra updateInstrument:instrument];
    
    // Restart the instrument if it is playing so the changes are instant
    if (isPlaying) [instrument restart];
}

// This function is triggered by the button on the storyboard file. When the user presses the button an audible tone is heard and the button updates its text to display the action performed by the next click.
- (IBAction)keyPressed:(UIButton *)sender {
    
    if (!isPlaying) {
        // Play the instrument
        [instrument play];
        // Update button label
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        // Update boolean value
        isPlaying = YES;
    } else {
        // Stop the instrument
        [instrument stop];
        // Update the button label
        [sender setTitle:@"Play" forState:UIControlStateNormal];
        // Update boolean value
        isPlaying = NO;
    }
}


@end
