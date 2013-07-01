//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Rectangles.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Math.h"
#import "pythagoras/d/IPoint.h"
#import "pythagoras/d/IRectangle.h"
#import "pythagoras/d/MathUtil.h"
#import "pythagoras/d/Point.h"
#import "pythagoras/d/Points.h"
#import "pythagoras/d/Rectangle.h"

@implementation PythagorasDRectangles

+ (void)intersectWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)src1
                 withPythagorasDIRectangle:(id<PythagorasDIRectangle>)src2
                  withPythagorasDRectangle:(PythagorasDRectangle *)dst {
  double x1 = [JavaLangMath maxWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) minX] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) minX]];
  double y1 = [JavaLangMath maxWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) minY] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) minY]];
  double x2 = [JavaLangMath minWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) maxX] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) maxX]];
  double y2 = [JavaLangMath minWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) maxY] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) maxY]];
  [((PythagorasDRectangle *) NIL_CHK(dst)) setBoundsWithDouble:x1 withDouble:y1 withDouble:x2 - x1 withDouble:y2 - y1];
}

+ (void)union__WithPythagorasDIRectangle:(id<PythagorasDIRectangle>)src1
               withPythagorasDIRectangle:(id<PythagorasDIRectangle>)src2
                withPythagorasDRectangle:(PythagorasDRectangle *)dst {
  double x1 = [JavaLangMath minWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) minX] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) minX]];
  double y1 = [JavaLangMath minWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) minY] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) minY]];
  double x2 = [JavaLangMath maxWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) maxX] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) maxX]];
  double y2 = [JavaLangMath maxWithDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src1)) maxY] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(src2)) maxY]];
  [((PythagorasDRectangle *) NIL_CHK(dst)) setBoundsWithDouble:x1 withDouble:y1 withDouble:x2 - x1 withDouble:y2 - y1];
}

+ (PythagorasDPoint *)closestInteriorPointWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r
                                              withPythagorasDIPoint:(id<PythagorasDIPoint>)p
                                               withPythagorasDPoint:(PythagorasDPoint *)outArg {
  (void) [((PythagorasDPoint *) NIL_CHK(outArg)) setWithDouble:[PythagorasDMathUtil clampWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) x] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(r)) minX] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(r)) maxX]] withDouble:[PythagorasDMathUtil clampWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) y] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(r)) minY] withDouble:[((id<PythagorasDIRectangle>) NIL_CHK(r)) maxY]]];
  return outArg;
}

+ (PythagorasDPoint *)closestInteriorPointWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r
                                              withPythagorasDIPoint:(id<PythagorasDIPoint>)p {
  return [PythagorasDRectangles closestInteriorPointWithPythagorasDIRectangle:r withPythagorasDIPoint:p withPythagorasDPoint:[[[PythagorasDPoint alloc] init] autorelease]];
}

+ (double)pointRectDistanceSqWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r
                                 withPythagorasDIPoint:(id<PythagorasDIPoint>)p {
  PythagorasDPoint *p2 = [PythagorasDRectangles closestInteriorPointWithPythagorasDIRectangle:r withPythagorasDIPoint:p];
  return [PythagorasDPoints distanceSqWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) x] withDouble:[((id<PythagorasDIPoint>) NIL_CHK(p)) y] withDouble:((PythagorasDPoint *) NIL_CHK(p2)).x_ withDouble:((PythagorasDPoint *) NIL_CHK(p2)).y_];
}

+ (double)pointRectDistanceWithPythagorasDIRectangle:(id<PythagorasDIRectangle>)r
                               withPythagorasDIPoint:(id<PythagorasDIPoint>)p {
  return [JavaLangMath sqrtWithDouble:[PythagorasDRectangles pointRectDistanceSqWithPythagorasDIRectangle:r withPythagorasDIPoint:p]];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
