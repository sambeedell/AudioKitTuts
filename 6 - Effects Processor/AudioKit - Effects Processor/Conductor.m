//
//  Conductor.h
//  AudioKit - Effects Processor
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//
//  ------------------------------------------------------------------------
//  Description:
//  This class is used to communicate all audio processes to AudioKit' Orchestra and Instruments.
//  It is used to seperate the UI processes from the time-crucial audio processes
//  ------------------------------------------------------------------------

#import "Conductor.h"

@implementation Conductor

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // Create and add instruments to the orchestra
        instrument = [[NewInstrument alloc] init];
        [AKOrchestra addInstrument:instrument];
        
        // Create and add effects to the orchestra
        effects = [[EffectsProcessor alloc] initWithAudioSource:instrument.auxilliaryOutput];
        [AKOrchestra addInstrument:effects];
        // Start the effects processor
        [effects start];
        
   }
    return self;
}

- (void)play{
    // Tell the instrumnet to play
    [instrument play];
}

- (void)stop{
    // Tell the instrumnet to stop
    [instrument stop];
}

@end
