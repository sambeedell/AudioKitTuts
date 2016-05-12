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

@synthesize oscillator, amp, freq;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // STEP 2
        // Instrument Properties
        freq = [self createPropertyWithValue:440 minimum:20 maximum:2000];
        amp  = [self createPropertyWithValue:0.5 minimum:0  maximum:1];
        
        // Instrument Definition
        oscillator = [AKOscillator oscillator];
        
        // STEP 3.1
        oscillator.frequency = freq;
        
        // Output source of the instrument
        // STEP 3.2
        [self setAudioOutput:[oscillator scaledBy:amp]];

    }
    return self;
}
@end

