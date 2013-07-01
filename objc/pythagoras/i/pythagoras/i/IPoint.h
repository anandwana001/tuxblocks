//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/i/IPoint.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasIPoint;

#import "JreEmulation.h"

@protocol PythagorasIIPoint < NSCopying, NSObject >
- (int)x;
- (int)y;
- (int)distanceSqWithInt:(int)px
                 withInt:(int)py;
- (int)distanceSqWithPythagorasIIPoint:(id<PythagorasIIPoint>)p;
- (int)distanceWithInt:(int)px
               withInt:(int)py;
- (int)distanceWithPythagorasIIPoint:(id<PythagorasIIPoint>)p;
- (PythagorasIPoint *)clone;
- (id)copyWithZone:(NSZone *)zone;
@end
