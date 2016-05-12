//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains all of the information required to build a simple oscillator using AudioKit.
//  This file also has an auxillary output object that is used to add effects to the instrument
//  Operations: http://audiokit.io/operations
//
//  ------------------------------------------------------------------------

#import "NewInstrument.h"

@implementation NewInstrument

@synthesize osc, amp, freq, auxilliaryOutput;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // Instrument Properties
        freq = [self createPropertyWithValue:440  minimum:20  maximum:2000];
        amp  = [self createPropertyWithValue:0.25 minimum:0.0 maximum:0.5];
        
        // Instrument Definition
        osc = [AKOscillator oscillator];
        osc.frequency = freq;
        osc.amplitude = akp(0.5);
        
        // Output source of the instrument
        [self setAudioOutput:osc];
        
        // Output to global effects processing (choose mono or stereo accordingly)
        auxilliaryOutput = [AKAudio globalParameter];
        //auxilliaryOutput = [AKStereoAudio globalParameter];
        [self assignOutput:auxilliaryOutput to:[osc scaledBy:amp]];

    }
    return self;
}

@end


