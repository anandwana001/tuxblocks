//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: react/UnitSignal.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "react/AbstractSignal.h"
#import "react/UnitSlot.h"

@implementation ReactUnitSignal

- (void)emit {
  [self notifyEmitWithId:nil];
}

- (ReactUnitSlot *)slot {
  return [[[ReactUnitSignal_$1 alloc] initWithReactUnitSignal:self] autorelease];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation ReactUnitSignal_$1

- (ReactUnitSignal *)this$0 {
  return this$0_;
}
- (void)setThis$0:(ReactUnitSignal *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onEmit {
  [this$0_ emit];
}

- (id)initWithReactUnitSignal:(ReactUnitSignal *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  ReactUnitSignal_$1 *typedCopy = (ReactUnitSignal_$1 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
