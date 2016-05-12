//
//  FMInstrument.h
//  AudioKit - Synthesis Example
//
//  Created by Sam Beedell on 02/07/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains the instrument definition for an Frequency Modulation synthesiser.
//  This uses AudioKit: www.audiokit.io
//
//  ------------------------------------------------------------------------

#import "AKFoundation.h"

@interface FMInstrument : AKInstrument

// To create a simple Frequency Modulation instrument, two signal generators are required. One is the carrier oscillator and one is the modulation oscillator
@property (nonatomic, strong) AKOscillator *modulationOsc;
@property (nonatomic, strong) AKOscillator *carrierOsc;

// The properties required to control each oscillator (carrier and modulation) are simply the frequency and amplitude of each oscillator.
// The 'mod' prefix signifies that this property is connected to the modulation oscillator
@property (nonatomic, strong) AKInstrumentProperty *modFreq;
@property (nonatomic, strong) AKInstrumentProperty *modIndex;
@property (nonatomic, strong) AKInstrumentProperty *amp;

// The frequency property for the carrier oscillator is not included as this will be introduced through AKNote later...

@end

// -----------------------------------------------------------------------------
// AKNote - http://audiokit.io/notes/
//
#  pragma mark - FMInstrumentNote
// -----------------------------------------------------------------------------

// Step 4 - Add a new interface to this class to hold the superclass of AKNote
@interface FMInstrumentNote : AKNote

// Step 5 - Add properties of the note which act as the variables (paramters) desired of this object
@property AKNoteProperty *frequency;

// Step 6 (optional) - Add global functions that provide an instant setter of the object and its properties
//- (instancetype)initWithFrequency:(float)frequency;

@end
