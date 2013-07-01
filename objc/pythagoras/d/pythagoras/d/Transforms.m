//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Transforms.java
//
//  Created by Thomas on 7/1/13.
//

#import "pythagoras/d/AffineTransform.h"
#import "pythagoras/d/IShape.h"
#import "pythagoras/d/Path.h"
#import "pythagoras/d/PathIterator.h"
#import "pythagoras/d/Transform.h"

@implementation PythagorasDTransforms

+ (id<PythagorasDIShape>)createTransformedShapeWithPythagorasDTransform:(id<PythagorasDTransform>)t
                                                  withPythagorasDIShape:(id<PythagorasDIShape>)src {
  if (src == nil) {
    return nil;
  }
  if ([(id) src isKindOfClass:[PythagorasDPath class]]) {
    return [((PythagorasDPath *) src) createTransformedShapeWithPythagorasDTransform:t];
  }
  id<PythagorasDPathIterator> path = [((id<PythagorasDIShape>) NIL_CHK(src)) pathIteratorWithPythagorasDTransform:t];
  PythagorasDPath *dst = [[[PythagorasDPath alloc] initWithInt:[((id<PythagorasDPathIterator>) NIL_CHK(path)) windingRule]] autorelease];
  [((PythagorasDPath *) NIL_CHK(dst)) appendWithPythagorasDPathIterator:path withBOOL:NO];
  return dst;
}

+ (id)multiplyWithPythagorasDAffineTransform:(PythagorasDAffineTransform *)a
              withPythagorasDAffineTransform:(PythagorasDAffineTransform *)b
                                      withId:(id<PythagorasDTransform>)into {
  return ((id<PythagorasDTransform>) [PythagorasDTransforms multiplyWithDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m00 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m01 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m10 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m11 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).tx_ withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).ty_ withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m00 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m01 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m10 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m11 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).tx_ withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).ty_ withId:into]);
}

+ (id)multiplyWithPythagorasDAffineTransform:(PythagorasDAffineTransform *)a
                                  withDouble:(double)m00
                                  withDouble:(double)m01
                                  withDouble:(double)m10
                                  withDouble:(double)m11
                                  withDouble:(double)tx
                                  withDouble:(double)ty
                                      withId:(id<PythagorasDTransform>)into {
  return ((id<PythagorasDTransform>) [PythagorasDTransforms multiplyWithDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m00 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m01 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m10 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).m11 withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).tx_ withDouble:((PythagorasDAffineTransform *) NIL_CHK(a)).ty_ withDouble:m00 withDouble:m01 withDouble:m10 withDouble:m11 withDouble:tx withDouble:ty withId:into]);
}

+ (id)multiplyWithDouble:(double)m00
              withDouble:(double)m01
              withDouble:(double)m10
              withDouble:(double)m11
              withDouble:(double)tx
              withDouble:(double)ty
withPythagorasDAffineTransform:(PythagorasDAffineTransform *)b
                  withId:(id<PythagorasDTransform>)into {
  return ((id<PythagorasDTransform>) [PythagorasDTransforms multiplyWithDouble:m00 withDouble:m01 withDouble:m10 withDouble:m11 withDouble:tx withDouble:ty withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m00 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m01 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m10 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).m11 withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).tx_ withDouble:((PythagorasDAffineTransform *) NIL_CHK(b)).ty_ withId:into]);
}

+ (id)multiplyWithDouble:(double)am00
              withDouble:(double)am01
              withDouble:(double)am10
              withDouble:(double)am11
              withDouble:(double)atx
              withDouble:(double)aty
              withDouble:(double)bm00
              withDouble:(double)bm01
              withDouble:(double)bm10
              withDouble:(double)bm11
              withDouble:(double)btx
              withDouble:(double)bty
                  withId:(id<PythagorasDTransform>)into {
  (void) [((id<PythagorasDTransform>) NIL_CHK(into)) setTransformWithDouble:am00 * bm00 + am10 * bm01 withDouble:am01 * bm00 + am11 * bm01 withDouble:am00 * bm10 + am10 * bm11 withDouble:am01 * bm10 + am11 * bm11 withDouble:am00 * btx + am10 * bty + atx withDouble:am01 * btx + am11 * bty + aty];
  return into;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
