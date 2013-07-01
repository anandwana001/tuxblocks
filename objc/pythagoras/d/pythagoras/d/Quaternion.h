//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Quaternion.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSDoubleArray;
@class JavaUtilRandom;
@class PythagorasDVector3;
@protocol PythagorasDIVector3;

#import "JreEmulation.h"
#import "java/io/Serializable.h"
#import "pythagoras/d/IQuaternion.h"

@interface PythagorasDQuaternion : NSObject < PythagorasDIQuaternion, JavaIoSerializable > {
 @public
  double x__, y__, z__, w__;
}

@property (nonatomic, assign) double x_;
@property (nonatomic, assign) double y_;
@property (nonatomic, assign) double z_;
@property (nonatomic, assign) double w_;

+ (id<PythagorasDIQuaternion>)IDENTITY;
- (id)initWithDouble:(double)x
          withDouble:(double)y
          withDouble:(double)z
          withDouble:(double)w;
- (id)initWithJavaLangDoubleArray:(IOSDoubleArray *)values;
- (id)initWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other;
- (id)init;
- (PythagorasDQuaternion *)setWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other;
- (PythagorasDQuaternion *)setWithJavaLangDoubleArray:(IOSDoubleArray *)values;
- (PythagorasDQuaternion *)setWithDouble:(double)x
                              withDouble:(double)y
                              withDouble:(double)z
                              withDouble:(double)w;
- (PythagorasDQuaternion *)fromVectorsWithPythagorasDIVector3:(id<PythagorasDIVector3>)from
                                      withPythagorasDIVector3:(id<PythagorasDIVector3>)to;
- (PythagorasDQuaternion *)fromVectorFromNegativeZWithPythagorasDIVector3:(id<PythagorasDIVector3>)to;
- (PythagorasDQuaternion *)fromVectorFromNegativeZWithDouble:(double)tx
                                                  withDouble:(double)ty
                                                  withDouble:(double)tz;
- (PythagorasDQuaternion *)fromAxesWithPythagorasDIVector3:(id<PythagorasDIVector3>)nx
                                   withPythagorasDIVector3:(id<PythagorasDIVector3>)ny
                                   withPythagorasDIVector3:(id<PythagorasDIVector3>)nz;
- (PythagorasDQuaternion *)fromAngleAxisWithDouble:(double)angle
                           withPythagorasDIVector3:(id<PythagorasDIVector3>)axis;
- (PythagorasDQuaternion *)fromAngleAxisWithDouble:(double)angle
                                        withDouble:(double)x
                                        withDouble:(double)y
                                        withDouble:(double)z;
- (PythagorasDQuaternion *)randomizeWithJavaUtilRandom:(JavaUtilRandom *)rand;
- (PythagorasDQuaternion *)fromAnglesXZWithDouble:(double)x
                                       withDouble:(double)z;
- (PythagorasDQuaternion *)fromAnglesXYWithDouble:(double)x
                                       withDouble:(double)y;
- (PythagorasDQuaternion *)fromAnglesWithPythagorasDVector3:(PythagorasDVector3 *)angles;
- (PythagorasDQuaternion *)fromAnglesWithDouble:(double)x
                                     withDouble:(double)y
                                     withDouble:(double)z;
- (PythagorasDQuaternion *)normalizeLocal;
- (PythagorasDQuaternion *)invertLocal;
- (PythagorasDQuaternion *)multLocalWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other;
- (PythagorasDQuaternion *)slerpLocalWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other
                                                     withDouble:(double)t;
- (PythagorasDVector3 *)transformLocalWithPythagorasDVector3:(PythagorasDVector3 *)vector;
- (PythagorasDQuaternion *)integrateLocalWithPythagorasDIVector3:(id<PythagorasDIVector3>)velocity
                                                      withDouble:(double)t;
- (double)x;
- (double)y;
- (double)z;
- (double)w;
- (void)getWithJavaLangDoubleArray:(IOSDoubleArray *)values;
- (BOOL)hasNaN;
- (PythagorasDVector3 *)toAnglesWithPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)toAngles;
- (PythagorasDQuaternion *)normalize;
- (PythagorasDQuaternion *)normalizeWithPythagorasDQuaternion:(PythagorasDQuaternion *)result;
- (PythagorasDQuaternion *)invert;
- (PythagorasDQuaternion *)invertWithPythagorasDQuaternion:(PythagorasDQuaternion *)result;
- (PythagorasDQuaternion *)multWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other;
- (PythagorasDQuaternion *)multWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other
                                withPythagorasDQuaternion:(PythagorasDQuaternion *)result;
- (PythagorasDQuaternion *)slerpWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other
                                                withDouble:(double)t;
- (PythagorasDQuaternion *)slerpWithPythagorasDIQuaternion:(id<PythagorasDIQuaternion>)other
                                                withDouble:(double)t
                                 withPythagorasDQuaternion:(PythagorasDQuaternion *)result;
- (PythagorasDVector3 *)transformWithPythagorasDIVector3:(id<PythagorasDIVector3>)vector;
- (PythagorasDVector3 *)transformWithPythagorasDIVector3:(id<PythagorasDIVector3>)vector
                                  withPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)transformUnitXWithPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)transformUnitYWithPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)transformUnitZWithPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)transformAndAddWithPythagorasDIVector3:(id<PythagorasDIVector3>)vector
                                       withPythagorasDIVector3:(id<PythagorasDIVector3>)add
                                        withPythagorasDVector3:(PythagorasDVector3 *)result;
- (PythagorasDVector3 *)transformScaleAndAddWithPythagorasDIVector3:(id<PythagorasDIVector3>)vector
                                                         withDouble:(double)scale_
                                            withPythagorasDIVector3:(id<PythagorasDIVector3>)add
                                             withPythagorasDVector3:(PythagorasDVector3 *)result;
- (double)transformZWithPythagorasDIVector3:(id<PythagorasDIVector3>)vector;
- (double)getRotationZ;
- (PythagorasDQuaternion *)integrateWithPythagorasDIVector3:(id<PythagorasDIVector3>)velocity
                                                 withDouble:(double)t;
- (PythagorasDQuaternion *)integrateWithPythagorasDIVector3:(id<PythagorasDIVector3>)velocity
                                                 withDouble:(double)t
                                  withPythagorasDQuaternion:(PythagorasDQuaternion *)result;
- (NSString *)description;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)other;
@end
