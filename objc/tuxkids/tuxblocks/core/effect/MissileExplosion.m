//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\effect\MissileExplosion.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/util/List.h"
#import "java/util/Random.h"
#import "playn/core/CanvasImage.h"
#import "playn/core/ImmediateLayer.h"
#import "playn/core/Layer.h"
#import "pythagoras/f/Vector.h"
#import "tripleplay/particle/Effector.h"
#import "tripleplay/particle/Emitter.h"
#import "tripleplay/particle/Generator.h"
#import "tripleplay/particle/Initializer.h"
#import "tripleplay/particle/effect/Alpha.h"
#import "tripleplay/particle/effect/Move.h"
#import "tripleplay/particle/init/Angle.h"
#import "tripleplay/particle/init/Color.h"
#import "tripleplay/particle/init/Lifespan.h"
#import "tripleplay/particle/init/TuxTransform.h"
#import "tripleplay/particle/init/TuxVelocity.h"
#import "tripleplay/util/Colors.h"
#import "tripleplay/util/Interpolator.h"
#import "tripleplay/util/Randoms.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/effect/MissileExplosion.h"
#import "tuxkids/tuxblocks/core/utils/CanvasUtils.h"

@implementation TBMissileExplosion

- (id)initWithTBDGrid:(TBDGrid *)grid
withPythagorasFVector:(PythagorasFVector *)position {
  if ((self = [super init])) {
    int p = 30;
    TPEmitter *emitter = [((TBDGrid *) NIL_CHK(grid)) createEmitterWithInt:p withPlaynCoreImage:[TBCanvasUtils createCircleWithFloat:2 withInt:[((TBDGrid *) NIL_CHK(grid)) towerColor]]];
    ((TPEmitter *) NIL_CHK(emitter)).generator = [TPGenerator impulseWithInt:p];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitLifespan constantWithFloat:1]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitColor constantWithInt:[TripleplayUtilColors WHITE]]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitTuxTransform layerWithPlaynCoreLayer:((TPEmitter *) NIL_CHK(emitter)).layer]];
    TripleplayUtilRandoms *rando = [TripleplayUtilRandoms withWithJavaUtilRandom:[[[JavaUtilRandom alloc] init] autorelease]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitTuxVelocity randomCircleWithTripleplayUtilRandoms:rando withFloat:50]];
    [((id<JavaUtilList>) NIL_CHK(emitter.effectors)) addWithId:[[[TripleplayParticleEffectMove alloc] init] autorelease]];
    [((id<JavaUtilList>) NIL_CHK(emitter.effectors)) addWithId:[TripleplayParticleEffectAlpha byAgeWithTripleplayUtilInterpolator:[TripleplayUtilInterpolator EASE_OUT] withFloat:1 withFloat:0]];
    [((TPEmitter *) NIL_CHK(emitter)) destroyOnEmpty];
    (void) [((id<PlaynCoreImmediateLayer>) NIL_CHK(emitter.layer)) setTranslationWithFloat:((PythagorasFVector *) NIL_CHK(position)).x_ withFloat:((PythagorasFVector *) NIL_CHK(position)).y_];
    emitter = [((TBDGrid *) NIL_CHK(grid)) createEmitterWithInt:10 withPlaynCoreImage:[TBCanvasUtils createRectWithFloat:5 withFloat:1 withInt:[TripleplayUtilColors WHITE]]];
    ((TPEmitter *) NIL_CHK(emitter)).generator = [TPGenerator impulseWithInt:10];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitLifespan constantWithFloat:1]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitColor constantWithInt:[TripleplayUtilColors BLACK]]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitTuxTransform layerWithPlaynCoreLayer:((TPEmitter *) NIL_CHK(emitter)).layer]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitTuxVelocity randomCircleWithTripleplayUtilRandoms:rando withFloat:50 withFloat:50]];
    [((id<JavaUtilList>) NIL_CHK(emitter.initters)) addWithId:[TripleplayParticleInitAngle byVelocity]];
    [((id<JavaUtilList>) NIL_CHK(emitter.effectors)) addWithId:[[[TripleplayParticleEffectMove alloc] init] autorelease]];
    [((id<JavaUtilList>) NIL_CHK(emitter.effectors)) addWithId:[TripleplayParticleEffectAlpha byAgeWithTripleplayUtilInterpolator:[TripleplayUtilInterpolator EASE_OUT] withFloat:1 withFloat:0]];
    [((TPEmitter *) NIL_CHK(emitter)) destroyOnEmpty];
    (void) [((id<PlaynCoreImmediateLayer>) NIL_CHK(emitter.layer)) setTranslationWithFloat:((PythagorasFVector *) NIL_CHK(position)).x_ withFloat:((PythagorasFVector *) NIL_CHK(position)).y_];
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

@end
