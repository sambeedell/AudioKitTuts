//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains the instrument definition for an Additive synthesiser
//
//  ------------------------------------------------------------------------

#import "AKFoundation.h"

@interface NewInstrument : AKInstrument

// Signal Generator
@property (nonatomic, strong) AKOscillator *osc;
// Instrument Properties
@property (nonatomic, strong) AKInstrumentProperty *freq;
@property (nonatomic, strong) AKInstrumentProperty *amp;

@end

