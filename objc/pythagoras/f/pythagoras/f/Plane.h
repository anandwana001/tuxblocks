//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Plane.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSFloatArray;
@class JavaNioFloatBuffer;
@class PythagorasFVector3;
@protocol PythagorasFIRay3;
@protocol PythagorasFIVector3;

#import "JreEmulation.h"
#import "java/io/Serializable.h"
#import "pythagoras/f/IPlane.h"

@interface PythagorasFPlane : NSObject < PythagorasFIPlane, JavaIoSerializable > {
 @public
  float constant__;
  PythagorasFVector3 *_normal_;
  PythagorasFVector3 *_v1_, *_v2_;
}

@property (nonatomic, assign) float constant_;
@property (nonatomic, retain) PythagorasFVector3 *_normal;
@property (nonatomic, retain) PythagorasFVector3 *_v1;
@property (nonatomic, retain) PythagorasFVector3 *_v2;

+ (PythagorasFPlane *)XY_PLANE;
+ (PythagorasFPlane *)XZ_PLANE;
+ (PythagorasFPlane *)YZ_PLANE;
- (id)initWithPythagorasFIVector3:(id<PythagorasFIVector3>)normal
                        withFloat:(float)constant;
- (id)initWithJavaLangFloatArray:(IOSFloatArray *)values;
- (id)initWithFloat:(float)a
          withFloat:(float)b
          withFloat:(float)c
          withFloat:(float)d;
- (id)initWithPythagorasFPlane:(PythagorasFPlane *)other;
- (id)init;
- (PythagorasFPlane *)setWithPythagorasFPlane:(PythagorasFPlane *)other;
- (PythagorasFPlane *)setWithPythagorasFIVector3:(id<PythagorasFIVector3>)normal
                                       withFloat:(float)constant;
- (PythagorasFPlane *)setWithJavaLangFloatArray:(IOSFloatArray *)values;
- (PythagorasFPlane *)setWithFloat:(float)a
                         withFloat:(float)b
                         withFloat:(float)c
                         withFloat:(float)d;
- (PythagorasFPlane *)fromPointsWithPythagorasFIVector3:(id<PythagorasFIVector3>)p1
                                withPythagorasFIVector3:(id<PythagorasFIVector3>)p2
                                withPythagorasFIVector3:(id<PythagorasFIVector3>)p3;
- (PythagorasFPlane *)fromPointNormalWithPythagorasFIVector3:(id<PythagorasFIVector3>)pt
                                     withPythagorasFIVector3:(id<PythagorasFIVector3>)normal;
- (PythagorasFPlane *)negateLocal;
- (float)constant;
- (id<PythagorasFIVector3>)normal;
- (JavaNioFloatBuffer *)getWithJavaNioFloatBuffer:(JavaNioFloatBuffer *)buf;
- (float)distanceWithPythagorasFIVector3:(id<PythagorasFIVector3>)pt;
- (PythagorasFPlane *)negate;
- (PythagorasFPlane *)negateWithPythagorasFPlane:(PythagorasFPlane *)result;
- (BOOL)intersectionWithPythagorasFIRay3:(id<PythagorasFIRay3>)ray
                  withPythagorasFVector3:(PythagorasFVector3 *)result;
- (float)distanceWithPythagorasFIRay3:(id<PythagorasFIRay3>)ray;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)other;
@end
