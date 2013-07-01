//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/IShape.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasDRectangle;
@protocol PythagorasDIPoint;
@protocol PythagorasDIRectangle;
@protocol PythagorasDPathIterator;
@protocol PythagorasDTransform;

#import "JreEmulation.h"

@protocol PythagorasDIShape < NSObject >
- (BOOL)isEmpty;
- (BOOL)containsWithDouble:(double)x
                withDouble:(double)y;
- (BOOL)containsWithPythagorasDIPoint:(id<PythagorasDIPoint>)point;
- (BOOL)containsWithDouble:(double)x
                withDouble:(double)y
                withDouble:(double)width
                withDouble:(double)height;
- (BOOL)containsWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r;
- (BOOL)intersectsWithDouble:(double)x
                  withDouble:(double)y
                  withDouble:(double)width
                  withDouble:(double)height;
- (BOOL)intersectsWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r;
- (PythagorasDRectangle *)bounds;
- (PythagorasDRectangle *)boundsWithPythagorasDRectangle:(PythagorasDRectangle *)target;
- (id<PythagorasDPathIterator>)pathIteratorWithPythagorasDTransform:(id<PythagorasDTransform>)at;
- (id<PythagorasDPathIterator>)pathIteratorWithPythagorasDTransform:(id<PythagorasDTransform>)at
                                                         withDouble:(double)flatness;
@end
