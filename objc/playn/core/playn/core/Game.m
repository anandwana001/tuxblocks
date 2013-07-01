//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/Game.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Asserts.h"
#import "playn/core/PlayN.h"

@implementation PlaynCoreGame_Default

@synthesize updateRate = updateRate_;
@synthesize nextUpdate = nextUpdate_;

- (id)initWithInt:(int)updateRate {
  if ((self = [super init])) {
    [PlaynCoreAsserts checkArgumentWithBOOL:updateRate > 0 withId:@"updateRate must be greater than zero."];
    self.updateRate = updateRate;
  }
  return self;
}

- (void)updateWithInt:(int)delta {
}

- (void)paintWithFloat:(float)alpha {
}

- (void)tickWithInt:(int)elapsed {
  int nextUpdate = self.nextUpdate, updateRate = self.updateRate;
  int updates = 0;
  while (elapsed >= nextUpdate) {
    nextUpdate += updateRate;
    updates++;
  }
  if (updates > 0) {
    [self updateWithInt:updates * updateRate];
    elapsed = [PlaynCorePlayN tick];
  }
  float alpha = 1 - (nextUpdate - elapsed) / (float) updateRate;
  [self paintWithFloat:alpha];
  self.nextUpdate = nextUpdate;
}

- (void)init__ OBJC_METHOD_FAMILY_NONE {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreGame_Default *typedCopy = (PlaynCoreGame_Default *) copy;
  typedCopy.updateRate = updateRate_;
  typedCopy.nextUpdate = nextUpdate_;
}

@end
