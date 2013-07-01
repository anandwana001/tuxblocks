//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/AbstractPoint.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasDPoint;

#import "JreEmulation.h"
#import "pythagoras/d/IPoint.h"

@interface PythagorasDAbstractPoint : NSObject < PythagorasDIPoint > {
}

- (double)distanceSqWithDouble:(double)px
                    withDouble:(double)py;
- (double)distanceSqWithPythagorasDIPoint:(id<PythagorasDIPoint>)p;
- (double)distanceWithDouble:(double)px
                  withDouble:(double)py;
- (double)distanceWithPythagorasDIPoint:(id<PythagorasDIPoint>)p;
- (double)directionWithPythagorasDIPoint:(id<PythagorasDIPoint>)other;
- (PythagorasDPoint *)multWithDouble:(double)s;
- (PythagorasDPoint *)multWithDouble:(double)s
                withPythagorasDPoint:(PythagorasDPoint *)result;
- (PythagorasDPoint *)addWithDouble:(double)x
                         withDouble:(double)y;
- (PythagorasDPoint *)addWithDouble:(double)x
                         withDouble:(double)y
               withPythagorasDPoint:(PythagorasDPoint *)result;
- (PythagorasDPoint *)subtractWithDouble:(double)x
                              withDouble:(double)y;
- (PythagorasDPoint *)subtractWithDouble:(double)x
                              withDouble:(double)y
                    withPythagorasDPoint:(PythagorasDPoint *)result;
- (PythagorasDPoint *)subtractWithPythagorasDIPoint:(id<PythagorasDIPoint>)other
                               withPythagorasDPoint:(PythagorasDPoint *)result;
- (PythagorasDPoint *)rotateWithDouble:(double)angle;
- (PythagorasDPoint *)rotateWithDouble:(double)angle
                  withPythagorasDPoint:(PythagorasDPoint *)result;
- (PythagorasDPoint *)clone;
- (BOOL)isEqual:(id)obj;
- (NSUInteger)hash;
- (NSString *)description;
- (double)x;
- (double)y;
- (id)init;
- (id)copyWithZone:(NSZone *)zone;
@end
