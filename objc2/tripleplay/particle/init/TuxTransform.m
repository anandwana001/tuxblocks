//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tripleplay/particle/init/TuxTransform.java
//
//  Created by Thomas on 7/10/13.
//

#import "IOSFloatArray.h"
#import "java/lang/System.h"
#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/InternalTransform.h"
#import "playn/core/Layer.h"
#import "playn/core/PlayN.h"
#import "playn/core/gl/GLContext.h"
#import "pythagoras/f/Transform.h"
#import "tripleplay/particle/GLStatus.h"
#import "tripleplay/particle/Initializer.h"
#import "tripleplay/particle/ParticleBuffer.h"
#import "tripleplay/particle/init/TuxTransform.h"

@implementation TripleplayParticleInitTuxTransform

+ (TripleplayParticleInitializer *)layerWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer {
  return [[TripleplayParticleInitTuxTransform_$1 alloc] initWithPlaynCoreLayer:layer];
}

- (id)init {
  return [super init];
}

@end
@implementation TripleplayParticleInitTuxTransform_$1

@synthesize xform = xform_;
@synthesize _matrix = _matrix_;
@synthesize val$layer = val$layer_;

- (void)willInitWithInt:(int)count {
  if (![TripleplayParticleGLStatus enabled]) {
    [((IOSFloatArray *) NIL_CHK(_matrix_)) replaceFloatAtIndex:0 withFloat:1];
    [((IOSFloatArray *) NIL_CHK(_matrix_)) replaceFloatAtIndex:3 withFloat:1];
    return;
  }
  (void) [((id<PlaynCoreInternalTransform>) NIL_CHK(xform_)) setTransformWithFloat:1 withFloat:0 withFloat:0 withFloat:1 withFloat:0 withFloat:0];
  id<PlaynCoreLayer> xlayer = val$layer_;
  while (xlayer != nil) {
    (void) [((id<PlaynCoreInternalTransform>) NIL_CHK(xform_)) preConcatenateWithPlaynCoreInternalTransform:(id<PlaynCoreInternalTransform>) [((id<PlaynCoreLayer>) NIL_CHK(xlayer)) transform]];
    xlayer = [((id<PlaynCoreLayer>) NIL_CHK(xlayer)) parent];
  }
  (void) [((id<PlaynCoreInternalTransform>) NIL_CHK(xform_)) preConcatenateWithPlaynCoreInternalTransform:[[((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) ctx] rootTransform]];
  [((id<PlaynCoreInternalTransform>) NIL_CHK(xform_)) getWithJavaLangFloatArray:_matrix_];
}

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE {
  [JavaLangSystem arraycopyWithId:_matrix_ withInt:0 withId:data withInt:start + TripleplayParticleParticleBuffer_M00 withInt:6];
}

- (id)initWithPlaynCoreLayer:(id<PlaynCoreLayer>)capture$0 {
  if ((self = [super init])) {
    val$layer_ = capture$0;
    xform_ = [TripleplayParticleGLStatus enabled] ? [[((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) ctx] createTransform] : nil;
    _matrix_ = [[IOSFloatArray alloc] initWithLength:6];
  }
  return self;
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayParticleInitTuxTransform_$1 *typedCopy = (TripleplayParticleInitTuxTransform_$1 *) copy;
  typedCopy.xform = xform_;
  typedCopy._matrix = _matrix_;
  typedCopy.val$layer = val$layer_;
}

@end