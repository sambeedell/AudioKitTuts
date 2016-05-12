//
//  AdditiveInstrument.m
//  AudioKit - Synthesis Example
//
//  Created by Sam Beedell on 02/07/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains all of the information required to build an FM sythesiser using AudioKit.
//  Operations:  http://audiokit.io/operations
//  AKParameter: http://audiokit.io/Classes/AKParameter.html
//  ------------------------------------------------------------------------

#import "FMInstrument.h"

@implementation FMInstrument

@synthesize carrierOsc, modulationOsc, modFreq, modIndex, amp;

- (instancetype)init
{
    self = [super init];
    if (self) {
        // Instrument Note Definition
        FMInstrumentNote *note = [[FMInstrumentNote alloc] init];
        
        // Instrument Properties
        modFreq  = [self createPropertyWithValue:440 minimum:5 maximum:2000];
        modIndex = [self createPropertyWithValue:100 minimum:0 maximum:500];
        amp      = [self createPropertyWithValue:0.5 minimum:0 maximum:1];
        
        // Instrument Definition
        carrierOsc    = [AKOscillator oscillator]; // Carrier
        modulationOsc = [AKOscillator oscillator]; // Modulator
        
        // Slider controls for the modulation oscillators frequency and amplitude properties
        modulationOsc.frequency = modFreq;
        modulationOsc.amplitude = modIndex;
        
        // Frequency Modulate the carrier by the modulator
        // See AKParameter 'Helper Functions' for a selection of math functions
        carrierOsc.frequency = [note.frequency plus:modulationOsc];
        carrierOsc.amplitude = amp;
        
        // Output source of the instrument
        [self setAudioOutput:carrierOsc];
        
    }
    return self;
}
@end

// -----------------------------------------------------------------------------
#  pragma mark - FMInstrumentNote
// -----------------------------------------------------------------------------

@implementation FMInstrumentNote

@synthesize frequency;

- (instancetype)init {
    self = [super init];
    if (self) {
        
        frequency = [self createPropertyWithValue:440 minimum:20 maximum:20000];
        
        self.duration.value = 2; // Useful for testing polyphony in the simulator - not required if a keyReleased method is used
    }
    return self;
}

@end

