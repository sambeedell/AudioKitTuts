//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains all of the information required to build an Additive synthesiser using AudioKit.
//  Operations: http://audiokit.io/operations
//
//  ------------------------------------------------------------------------

#import "NewInstrument.h"

@implementation NewInstrument

@synthesize osc, amp, freq;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // Instrument Properties
        freq = [self createPropertyWithValue:440 minimum:20 maximum:2000];
        amp  = [self createPropertyWithValue:0.5 minimum:0  maximum:0.99];
        
        // Instrument Definition
        osc = [AKOscillator oscillator];
        osc.frequency = freq;
        
        // Output source of the instrument
        [self setAudioOutput:[osc scaledBy:amp]];

    }
    return self;
}

@end


