//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/game/Screen.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/PlayN.h"
#import "playn/core/util/Clock.h"

@implementation TripleplayGameScreen

- (id<PlaynCoreGroupLayer>)layer {
  return layer_;
}
- (void)setLayer:(id<PlaynCoreGroupLayer>)layer {
  JreOperatorRetainedAssign(&layer_, self, layer);
}
@synthesize layer = layer_;

- (float)width {
  return [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) width];
}

- (float)height {
  return [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) height];
}

- (void)wasAdded {
}

- (void)wasShown {
}

- (void)wasHidden {
}

- (void)wasRemoved {
}

- (void)showTransitionCompleted {
}

- (void)hideTransitionStarted {
}

- (void)updateWithInt:(int)delta {
}

- (void)paintWithPlaynCoreUtilClock:(id<PlaynCoreUtilClock>)clock {
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&layer_, self, [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createGroupLayer]);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&layer_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayGameScreen *typedCopy = (TripleplayGameScreen *) copy;
  typedCopy.layer = layer_;
}

@end
