//
//  EffectsProcessor.h
//  AudioKit - Effects Processor
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file is taken from the AudioKit templates. It defines the input, signal modification
//
//  A selection of existing effects classes are provided here: https://github.com/audiokit/Examples/tree/master/iOS%20Examples/Objective-C/EffectsProcessorDemo/EffectsProcessorDemo/Instruments
//  ------------------------------------------------------------------------

#import "EffectsProcessor.h"

@implementation EffectsProcessor

@synthesize feedback;

- (instancetype)initWithAudioSource:(AKAudio *)audioSource
{
    self = [super init];
    if (self) {

        // Effect Properties
        feedback = [self createPropertyWithValue:0.8 minimum:0.0 maximum:0.9];

        // Effect Definition
        AKReverb *reverb = [[AKReverb alloc] initWithInput:audioSource
                                                  feedback:feedback
                                           cutoffFrequency:akp(4000)];

        // Audio Output
        [self setAudioOutput:reverb];

        // Reset Inputs
        [self resetParameter:audioSource];
    }
    return self;
}
@end
