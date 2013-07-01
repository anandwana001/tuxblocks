//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/util/Input.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/util/ArrayList.h"
#import "java/util/List.h"
#import "playn/core/Events.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/Layer.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/IRectangle.h"
#import "pythagoras/f/Point.h"

@implementation TripleplayUtilInput

- (id<TripleplayUtilInput_Registration>)register__WithTripleplayUtilInput_Region:(TripleplayUtilInput_Region *)region
                                                                          withId:(id)listener {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id<TripleplayUtilInput_Registration>)register__WithId:(id)listener {
  return [self register__WithTripleplayUtilInput_Region:[[[TripleplayUtilInput_ScreenRegion alloc] init] autorelease] withId:listener];
}

- (id<TripleplayUtilInput_Registration>)register__WithPythagorasFIRectangle:(id<PythagorasFIRectangle>)bounds
                                                                     withId:(id)listener {
  return [self register__WithTripleplayUtilInput_Region:[[[TripleplayUtilInput_BoundsRegion alloc] initWithPythagorasFIRectangle:bounds] autorelease] withId:listener];
}

- (id<TripleplayUtilInput_Registration>)register__WithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
                                           withPythagorasFIRectangle:(id<PythagorasFIRectangle>)bounds
                                                              withId:(id)listener {
  return [self register__WithTripleplayUtilInput_Region:[[[TripleplayUtilInput_LayerRegion alloc] initWithPlaynCoreLayer:layer withPythagorasFIRectangle:bounds] autorelease] withId:listener];
}

- (id<TripleplayUtilInput_Registration>)register__WithPlaynCoreLayer_HasSize:(id<PlaynCoreLayer_HasSize>)layer
                                                                      withId:(id)listener {
  return [self register__WithTripleplayUtilInput_Region:[[[TripleplayUtilInput_SizedLayerRegion alloc] initWithPlaynCoreLayer_HasSize:layer] autorelease] withId:listener];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation TripleplayUtilInput_Region

- (BOOL)canTrigger {
  return YES;
}

- (BOOL)hasExpired {
  return NO;
}

- (BOOL)hitTestWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation TripleplayUtilInput_ScreenRegion

- (BOOL)hitTestWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  return YES;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation TripleplayUtilInput_BoundsRegion

- (id<PythagorasFIRectangle>)_bounds {
  return _bounds_;
}
- (void)set_bounds:(id<PythagorasFIRectangle>)_bounds {
  JreOperatorRetainedAssign(&_bounds_, self, _bounds);
}
@synthesize _bounds = _bounds_;

- (id)initWithPythagorasFIRectangle:(id<PythagorasFIRectangle>)bounds {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_bounds_, self, bounds);
  }
  return self;
}

- (BOOL)hitTestWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  return [((id<PythagorasFIRectangle>) NIL_CHK(_bounds_)) containsWithPythagorasFIPoint:p];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_bounds_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_BoundsRegion *typedCopy = (TripleplayUtilInput_BoundsRegion *) copy;
  typedCopy._bounds = _bounds_;
}

@end
@implementation TripleplayUtilInput_LayerRegion

- (id<PlaynCoreLayer>)_layer {
  return _layer_;
}
- (void)set_layer:(id<PlaynCoreLayer>)_layer {
  JreOperatorRetainedAssign(&_layer_, self, _layer);
}
@synthesize _layer = _layer_;
- (id<PythagorasFIRectangle>)_bounds {
  return _bounds_;
}
- (void)set_bounds:(id<PythagorasFIRectangle>)_bounds {
  JreOperatorRetainedAssign(&_bounds_, self, _bounds);
}
@synthesize _bounds = _bounds_;

- (id)initWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
   withPythagorasFIRectangle:(id<PythagorasFIRectangle>)bounds {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_layer_, self, layer);
    JreOperatorRetainedAssign(&_bounds_, self, bounds);
  }
  return self;
}

- (BOOL)canTrigger {
  return [((id<PlaynCoreLayer>) NIL_CHK(_layer_)) visible];
}

- (BOOL)hasExpired {
  return [((id<PlaynCoreLayer>) NIL_CHK(_layer_)) parent] == nil;
}

- (BOOL)hitTestWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  return [((id<PythagorasFIRectangle>) NIL_CHK(_bounds_)) containsWithPythagorasFIPoint:[PlaynCoreLayer_Util screenToLayerWithPlaynCoreLayer:_layer_ withPythagorasFIPoint:p withPythagorasFPoint:[[[PythagorasFPoint alloc] init] autorelease]]];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_bounds_, self, nil);
  JreOperatorRetainedAssign(&_layer_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_LayerRegion *typedCopy = (TripleplayUtilInput_LayerRegion *) copy;
  typedCopy._layer = _layer_;
  typedCopy._bounds = _bounds_;
}

@end
@implementation TripleplayUtilInput_SizedLayerRegion

- (id<PlaynCoreLayer_HasSize>)_layer {
  return _layer_;
}
- (void)set_layer:(id<PlaynCoreLayer_HasSize>)_layer {
  JreOperatorRetainedAssign(&_layer_, self, _layer);
}
@synthesize _layer = _layer_;

- (id)initWithPlaynCoreLayer_HasSize:(id<PlaynCoreLayer_HasSize>)layer {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_layer_, self, layer);
  }
  return self;
}

- (BOOL)canTrigger {
  return [((id<PlaynCoreLayer_HasSize>) NIL_CHK(_layer_)) visible];
}

- (BOOL)hasExpired {
  return [((id<PlaynCoreLayer_HasSize>) NIL_CHK(_layer_)) parent] == nil;
}

- (BOOL)hitTestWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  PythagorasFPoint *lp = [PlaynCoreLayer_Util screenToLayerWithPlaynCoreLayer:_layer_ withPythagorasFIPoint:p withPythagorasFPoint:[[[PythagorasFPoint alloc] init] autorelease]];
  float x = ((PythagorasFPoint *) NIL_CHK(lp)).x_, y = ((PythagorasFPoint *) NIL_CHK(lp)).y_;
  return (x > 0 && y > 0 && x < [((id<PlaynCoreLayer_HasSize>) NIL_CHK(_layer_)) scaledWidth] && y < [((id<PlaynCoreLayer_HasSize>) NIL_CHK(_layer_)) scaledHeight]);
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_layer_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_SizedLayerRegion *typedCopy = (TripleplayUtilInput_SizedLayerRegion *) copy;
  typedCopy._layer = _layer_;
}

@end
@implementation TripleplayUtilInput_Reactor

- (id<JavaUtilList>)_reactions {
  return _reactions_;
}
- (void)set_reactions:(id<JavaUtilList>)_reactions {
  JreOperatorRetainedAssign(&_reactions_, self, _reactions);
}
@synthesize _reactions = _reactions_;

- (id)hitTestWithPlaynCoreEvents_Position:(id<PlaynCoreEvents_Position>)event {
  id<JavaUtilList> snapshot = [[[JavaUtilArrayList alloc] initWithJavaUtilCollection:_reactions_] autorelease];
  PythagorasFPoint *p = [[[PythagorasFPoint alloc] initWithFloat:[((id<PlaynCoreEvents_Position>) NIL_CHK(event)) x] withFloat:[((id<PlaynCoreEvents_Position>) NIL_CHK(event)) y]] autorelease];
  for (int ii = [((id<JavaUtilList>) NIL_CHK(snapshot)) size] - 1; ii >= 0; ii--) {
    TripleplayUtilInput_Reaction *r = ((TripleplayUtilInput_Reaction *) [((id<JavaUtilList>) NIL_CHK(snapshot)) getWithInt:ii]);
    if ([((TripleplayUtilInput_Region *) NIL_CHK(r.region)) hasExpired]) {
      [((id<JavaUtilList>) NIL_CHK(_reactions_)) removeWithId:r];
    }
    else if ([((TripleplayUtilInput_Region *) NIL_CHK(r.region)) canTrigger] && [((TripleplayUtilInput_Region *) NIL_CHK(r.region)) hitTestWithPythagorasFIPoint:p]) {
      return ((TripleplayUtilInput_Reaction *) NIL_CHK(r)).listener;
    }
  }
  return nil;
}

- (id<TripleplayUtilInput_Registration>)register__WithTripleplayUtilInput_Region:(TripleplayUtilInput_Region *)region
                                                                          withId:(id)listener {
  TripleplayUtilInput_Reaction *reaction = [[[TripleplayUtilInput_Reaction alloc] initWithTripleplayUtilInput_Region:region withId:listener] autorelease];
  [((id<JavaUtilList>) NIL_CHK(_reactions_)) addWithId:reaction];
  return [[[TripleplayUtilInput_Reactor_$1 alloc] initWithTripleplayUtilInput_Reactor:self withTripleplayUtilInput_Reaction:reaction] autorelease];
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_reactions_, self, [[[JavaUtilArrayList alloc] init] autorelease]);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_reactions_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_Reactor *typedCopy = (TripleplayUtilInput_Reactor *) copy;
  typedCopy._reactions = _reactions_;
}

@end
@implementation TripleplayUtilInput_Reactor_$1

- (TripleplayUtilInput_Reactor *)this$0 {
  return this$0_;
}
- (void)setThis$0:(TripleplayUtilInput_Reactor *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (TripleplayUtilInput_Reaction *)val$reaction {
  return val$reaction_;
}
- (void)setVal$reaction:(TripleplayUtilInput_Reaction *)val$reaction {
  JreOperatorRetainedAssign(&val$reaction_, self, val$reaction);
}
@synthesize val$reaction = val$reaction_;

- (void)cancel {
  [((id<JavaUtilList>) NIL_CHK(this$0_._reactions)) removeWithId:val$reaction_];
}

- (id)initWithTripleplayUtilInput_Reactor:(TripleplayUtilInput_Reactor *)outer$
         withTripleplayUtilInput_Reaction:(TripleplayUtilInput_Reaction *)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$reaction_, self, capture$0);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$reaction_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_Reactor_$1 *typedCopy = (TripleplayUtilInput_Reactor_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$reaction = val$reaction_;
}

@end
@implementation TripleplayUtilInput_Reaction

- (TripleplayUtilInput_Region *)region {
  return region_;
}
- (void)setRegion:(TripleplayUtilInput_Region *)region {
  JreOperatorRetainedAssign(&region_, self, region);
}
@synthesize region = region_;
- (id)listener {
  return listener_;
}
- (void)setListener:(id)listener {
  JreOperatorRetainedAssign(&listener_, self, listener);
}
@synthesize listener = listener_;

- (id)initWithTripleplayUtilInput_Region:(TripleplayUtilInput_Region *)region
                                  withId:(id)listener {
  if ((self = [super init])) {
    self.region = region;
    self.listener = listener;
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&listener_, self, nil);
  JreOperatorRetainedAssign(&region_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUtilInput_Reaction *typedCopy = (TripleplayUtilInput_Reaction *) copy;
  typedCopy.region = region_;
  typedCopy.listener = listener_;
}

@end
