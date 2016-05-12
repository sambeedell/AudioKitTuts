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
    FMInstrument *fmInstrument; // This is the AKInstrument subclass declaration
    FMInstrumentNote *note; // This is the AKNote subclass declaration
    
    // Property sliders used on the UI
    IBOutlet AKPropertySlider *modulationFrequency;
    IBOutlet AKPropertySlider *modulationIndex;
    IBOutlet AKPropertySlider *amplitude;
    
    // Used to load an array of note frequencies and store played notes
    NSArray *frequencies;
    NSMutableDictionary *currentNotes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Load note frequencies into an array
    // - See ManualFMSynthesis for a more flexible/practical way of reading note frequencies.
    frequencies = @[@440, @466.16, @493.88, @523.25, @554.37, @587.33, @622.25, @659.26, @698.46, @739.99, @783.99, @830.61, @880, @932.33, @987.77, @1046.5];
    currentNotes = [NSMutableDictionary dictionary];
    
    fmInstrument = [[FMInstrument alloc] init]; // Here we are allocating memory for the AKInstrument subclass and intialising it.
    [AKOrchestra addInstrument:fmInstrument]; // This line adds the declared AudioKit instruments to the AKOrchestra

    // Connect the UISliders to the AKInstrumentProperty objects
    modulationFrequency.property = fmInstrument.modFreq;
    modulationIndex.property     = fmInstrument.modIndex;
    amplitude.property           = fmInstrument.amp;
    
}

// This function is triggered by the button on the storyboard file. When the user presses the button an audible tone is heard and the button updates its text to display the action performed by the next click.
- (IBAction)keyPressed:(id)sender {
    
    // Recieve the tag of the button pressed
    NSInteger tag = [(UIButton *)sender tag];
    
    // Initialise a note object to be sent to an instrument to be played
    note = [[FMInstrumentNote alloc] init];
    // Set the frequency property of note object using the tag property
    // This value will determine the associated frequency to be played
    note.frequency.value = [[frequencies objectAtIndex:tag] floatValue];
    
    // Play the note
    [fmInstrument playNote:note];
    
    // Save the note object to an array
    [currentNotes setObject:note forKey:[NSNumber numberWithInt:(int)tag]];

}

- (IBAction)keyReleased:(id)sender {
    
//    // Recieve the tag of the button pressed
//    NSInteger tag = [(UIButton *)sender tag];
//    
//    // Get the key note instance from the tag property
//    FMInstrumentNote *noteToRelease = [currentNotes objectForKey:[NSNumber numberWithInt:(int)tag]];
//
//    // Stop the note
//    [fmInstrument stopNote:noteToRelease];
//    
//    // Remove the note from the array
//    [currentNotes removeObjectForKey:[NSNumber numberWithInt:(int)tag]];
}

@end
