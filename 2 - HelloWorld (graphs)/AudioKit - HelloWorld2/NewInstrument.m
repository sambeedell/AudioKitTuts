//
//  NewInstrument.h
//  AudioKit - HelloWorld2
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
    // This starts the Orchestra (which only ever happens once)
    self = [super init]; 
    if (self) {
        
        // Envelope Definition
        // This envelope is completely optional, in this case it is neccesary to remove the pop from turning the instrument on/off
        AKLinearADSREnvelope *env = [AKLinearADSREnvelope envelope];
        
        // Instrument Definition
        osc = [AKOscillator oscillator];
        osc.amplitude = env;
        // The envelope goes from 0 -> 1, if the amplitude goes above 1 then it will clip and distort
        
        // Output source of the instrument
        [self setAudioOutput:osc];

    }
    return self;
}
@end
