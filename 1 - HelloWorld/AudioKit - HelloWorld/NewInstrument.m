//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains all of the information required to build an instrument using AudioKit.
//  Operations: http://audiokit.io/operations
//
//  ------------------------------------------------------------------------

#import "NewInstrument.h"

@implementation NewInstrument

// Produces setter and getter function for controlling properties 
@synthesize osc;

- (instancetype)init
{
    // Firstly, we must call the intialisation code for the inherited class (AKInstrument)
    // This starts the Orchestra (which only ever happens once) but also sets up the low-level features of the AKInstrument object
    self = [super init]; 
    if (self) {
        
        // Instrument Definition
        osc = [AKOscillator oscillator];
        
        /* Any 'Signal Generator' operation can be declared here (see link in the description) with it's default parameters set to intialise itself. Remember to change the output of this instrument to hear the new signal generator.
        
         For Example:
         
         AKSandPaper *paper = [AKSandPaper sandPaper];
         AKVibes     *vibes = [AKVibes vibes];
         AKFlute     *flute = [AKFlute flute];
         AKNoise     *noise = [AKNoise noise];
         
         */
        
        // Output source of the instrument
        [self setAudioOutput:osc];

    }
    return self;
}
@end
