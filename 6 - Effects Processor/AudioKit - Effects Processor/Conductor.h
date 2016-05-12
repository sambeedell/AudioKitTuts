//
//  Conductor.h
//  AudioKit - Effects Processor
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This file contains the audio objects required to genrate an audible signal and communicate to them
//
//  ------------------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "AKFoundation.h"
#import "NewInstrument.h"
#import "EffectsProcessor.h"
#import "AKPropertySlider.h"

@interface Conductor : NSObject{
    // Instruments and other instance variables
@public
    NewInstrument *instrument;
    EffectsProcessor *effects;
}

- (void)play;
- (void)stop;
//- (void)effectsChanged:(AKPropertySlider *)slider;

@end
