//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/IQuadCurve.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasDPoint;
@class PythagorasDQuadCurve;

#import "JreEmulation.h"
#import "pythagoras/d/IShape.h"

@protocol PythagorasDIQuadCurve < PythagorasDIShape, NSCopying, NSObject >
- (double)x1;
- (double)y1;
- (double)ctrlX;
- (double)ctrlY;
- (double)x2;
- (double)y2;
- (PythagorasDPoint *)p1;
- (PythagorasDPoint *)ctrlP;
- (PythagorasDPoint *)p2;
- (double)flatnessSq;
- (double)flatness;
- (void)subdivideWithPythagorasDQuadCurve:(PythagorasDQuadCurve *)left
                 withPythagorasDQuadCurve:(PythagorasDQuadCurve *)right;
- (PythagorasDQuadCurve *)clone;
- (id)copyWithZone:(NSZone *)zone;
@end
