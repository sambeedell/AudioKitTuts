//
//  EffectsProcessor.h
//  AudioKit - Effects Processor
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file is taken from the AudioKit templates. It contains a basic reverb processor with a feedback parameter.
//
//  ------------------------------------------------------------------------

#import "AKFoundation.h"

@interface EffectsProcessor : AKInstrument

@property (nonatomic) AKInstrumentProperty *feedback;

- (instancetype)initWithAudioSource:(AKAudio *)audioSource;

@end
