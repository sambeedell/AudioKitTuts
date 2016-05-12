//
//  NewInstrument.h
//  AudioKit - HelloWorld
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains the instrument definition for an AudioKit instrument.
//  It is a superclass of AKInstrument which means that this class will not run on its own but is designed to hold all the information neccessary to define a signal generator and associated properties.

//  ------------------------------------------------------------------------

// This import is required for any class that wishes to use AudioKit. AKFoundation.h holds all of the neccesary files to make AudioKit operate
#import "AKFoundation.h"

// The 'AKInstrument' after the colon (below) defines the superclass of this class.
@interface NewInstrument : AKInstrument

// The properties of the instrument are defined here so that they can be accessed after instantiation by the parent class. These properties allow user-defined controls over specific attributes of the sound generation algorithm.
@property (nonatomic, strong) AKOscillator *osc;



@end
