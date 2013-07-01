//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/IQuadCurve.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasFPoint;
@class PythagorasFQuadCurve;

#import "JreEmulation.h"
#import "pythagoras/f/IShape.h"

@protocol PythagorasFIQuadCurve < PythagorasFIShape, NSCopying, NSObject >
- (float)x1;
- (float)y1;
- (float)ctrlX;
- (float)ctrlY;
- (float)x2;
- (float)y2;
- (PythagorasFPoint *)p1;
- (PythagorasFPoint *)ctrlP;
- (PythagorasFPoint *)p2;
- (float)flatnessSq;
- (float)flatness;
- (void)subdivideWithPythagorasFQuadCurve:(PythagorasFQuadCurve *)left
                 withPythagorasFQuadCurve:(PythagorasFQuadCurve *)right;
- (PythagorasFQuadCurve *)clone;
- (id)copyWithZone:(NSZone *)zone;
@end
