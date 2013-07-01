//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tripleplay\particle\init\TuxVelocity.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSFloatArray;
@class PythagorasFVector;
@class TripleplayUtilRandoms;

#import "JreEmulation.h"
#import "tripleplay/particle/Initializer.h"

@interface TripleplayParticleInitTuxVelocity : NSObject {
}

+ (TPInitializer *)constantWithPythagorasFVector:(PythagorasFVector *)velocity;
+ (TPInitializer *)randomSquareWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)xRange
                                               withFloat:(float)yRange;
+ (TPInitializer *)randomSquareWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)minX
                                               withFloat:(float)maxX
                                               withFloat:(float)minY
                                               withFloat:(float)maxY;
+ (TPInitializer *)randomNormalWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)mean
                                               withFloat:(float)dev;
+ (TPInitializer *)randomNormalWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)xMean
                                               withFloat:(float)xDev
                                               withFloat:(float)yMean
                                               withFloat:(float)yDev;
+ (TPInitializer *)randomCircleWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)maximum;
+ (TPInitializer *)randomCircleWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)rando
                                               withFloat:(float)min
                                               withFloat:(float)max;
+ (TPInitializer *)incrementWithFloat:(float)dx
                            withFloat:(float)dy;
- (id)init;
@end

@interface TripleplayParticleInitTuxVelocity_VelocityInitializer : TPInitializer {
 @public
  PythagorasFVector *_vel_;
}

@property (nonatomic, retain) PythagorasFVector *_vel;

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE;
- (void)initVelocityWithPythagorasFVector:(PythagorasFVector *)vel OBJC_METHOD_FAMILY_NONE;
- (id)init;
@end

@interface TripleplayParticleInitTuxVelocity_$1 : TripleplayParticleInitTuxVelocity_VelocityInitializer {
 @public
  PythagorasFVector *val$velocity_;
}

@property (nonatomic, retain) PythagorasFVector *val$velocity;

- (void)initVelocityWithPythagorasFVector:(PythagorasFVector *)vel OBJC_METHOD_FAMILY_NONE;
- (id)initWithPythagorasFVector:(PythagorasFVector *)capture$0;
@end

@interface TripleplayParticleInitTuxVelocity_$2 : TripleplayParticleInitTuxVelocity_VelocityInitializer {
 @public
  TripleplayUtilRandoms *val$rando_;
  float val$minX_;
  float val$maxX_;
  float val$minY_;
  float val$maxY_;
}

@property (nonatomic, retain) TripleplayUtilRandoms *val$rando;
@property (nonatomic, assign) float val$minX;
@property (nonatomic, assign) float val$maxX;
@property (nonatomic, assign) float val$minY;
@property (nonatomic, assign) float val$maxY;

- (void)initVelocityWithPythagorasFVector:(PythagorasFVector *)vel OBJC_METHOD_FAMILY_NONE;
- (id)initWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)capture$0
                          withFloat:(float)capture$1
                          withFloat:(float)capture$2
                          withFloat:(float)capture$3
                          withFloat:(float)capture$4;
@end

@interface TripleplayParticleInitTuxVelocity_$3 : TripleplayParticleInitTuxVelocity_VelocityInitializer {
 @public
  TripleplayUtilRandoms *val$rando_;
  float val$xMean_;
  float val$xDev_;
  float val$yMean_;
  float val$yDev_;
}

@property (nonatomic, retain) TripleplayUtilRandoms *val$rando;
@property (nonatomic, assign) float val$xMean;
@property (nonatomic, assign) float val$xDev;
@property (nonatomic, assign) float val$yMean;
@property (nonatomic, assign) float val$yDev;

- (void)initVelocityWithPythagorasFVector:(PythagorasFVector *)vel OBJC_METHOD_FAMILY_NONE;
- (id)initWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)capture$0
                          withFloat:(float)capture$1
                          withFloat:(float)capture$2
                          withFloat:(float)capture$3
                          withFloat:(float)capture$4;
@end

@interface TripleplayParticleInitTuxVelocity_$4 : TripleplayParticleInitTuxVelocity_VelocityInitializer {
 @public
  TripleplayUtilRandoms *val$rando_;
  float val$min_;
  float val$max_;
}

@property (nonatomic, retain) TripleplayUtilRandoms *val$rando;
@property (nonatomic, assign) float val$min;
@property (nonatomic, assign) float val$max;

- (void)initVelocityWithPythagorasFVector:(PythagorasFVector *)vel OBJC_METHOD_FAMILY_NONE;
- (id)initWithTripleplayUtilRandoms:(TripleplayUtilRandoms *)capture$0
                          withFloat:(float)capture$1
                          withFloat:(float)capture$2;
@end

@interface TripleplayParticleInitTuxVelocity_$5 : TPInitializer {
 @public
  float val$dx_;
  float val$dy_;
}

@property (nonatomic, assign) float val$dx;
@property (nonatomic, assign) float val$dy;

- (void)init__WithInt:(int)index
withJavaLangFloatArray:(IOSFloatArray *)data
              withInt:(int)start OBJC_METHOD_FAMILY_NONE;
- (id)initWithFloat:(float)capture$0
          withFloat:(float)capture$1;
@end
