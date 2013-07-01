//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/game/trans/FadeTransition.java
//
//  Created by Thomas on 7/1/13.
//

@class TripleplayGameScreen;
@class TripleplayGameScreenStack;

#import "JreEmulation.h"
#import "tripleplay/game/trans/InterpedTransition.h"

@interface TripleplayGameTransFadeTransition : TripleplayGameTransInterpedTransition {
}

- (id)initWithTripleplayGameScreenStack:(TripleplayGameScreenStack *)stack;
- (void)init__WithTripleplayGameScreen:(TripleplayGameScreen *)oscreen
              withTripleplayGameScreen:(TripleplayGameScreen *)nscreen OBJC_METHOD_FAMILY_NONE;
- (BOOL)updateWithTripleplayGameScreen:(TripleplayGameScreen *)oscreen
              withTripleplayGameScreen:(TripleplayGameScreen *)nscreen
                             withFloat:(float)elapsed;
- (void)completeWithTripleplayGameScreen:(TripleplayGameScreen *)oscreen
                withTripleplayGameScreen:(TripleplayGameScreen *)nscreen;
@end
