//
//  ViewController.h
//  AudioKit - HelloWorld2
//
//  Created by Sam Beedell on 24/06/2015.
//  Copyright (c) 2015 Sam Beedell. All rights reserved.
//

#import <UIKit/UIKit.h>
// These imports are required to utilise AudioKit functionality within this class and also access the AKInstrument definition declared in the 'NewInstrument' class.
#import "AKFoundation.h"
#import "NewInstrument.h"

// This gesture recogniser delegate allows for swipe gestures which change the audio plots from input to output
@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@end

