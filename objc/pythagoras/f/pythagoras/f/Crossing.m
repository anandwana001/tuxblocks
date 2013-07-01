//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/Crossing.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "IOSFloatArray.h"
#import "java/lang/Math.h"
#import "pythagoras/f/FloatMath.h"
#import "pythagoras/f/IShape.h"
#import "pythagoras/f/PathIterator.h"
#import "pythagoras/f/Rectangle.h"

@implementation PythagorasFCrossing

+ (int)CROSSING {
  return PythagorasFCrossing_CROSSING;
}

+ (int)UNKNOWN {
  return PythagorasFCrossing_UNKNOWN;
}

+ (float)DELTA {
  return PythagorasFCrossing_DELTA;
}

+ (float)ROOT_DELTA {
  return PythagorasFCrossing_ROOT_DELTA;
}

+ (int)solveQuadWithJavaLangFloatArray:(IOSFloatArray *)eqn
                withJavaLangFloatArray:(IOSFloatArray *)res {
  float a = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:2];
  float b = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:1];
  float c = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:0];
  int rc = 0;
  if (a == 0.0f) {
    if (b == 0.0f) {
      return -1;
    }
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:-c / b];
  }
  else {
    float d = b * b - 4.0f * a * c;
    if (d < 0.0f) {
      return 0;
    }
    d = [PythagorasFFloatMath sqrtWithFloat:d];
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:(-b + d) / (a * 2.0f)];
    if (d != 0.0f) {
      [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:(-b - d) / (a * 2.0f)];
    }
  }
  return [PythagorasFCrossing fixRootsWithJavaLangFloatArray:res withInt:rc];
}

+ (int)solveCubicWithJavaLangFloatArray:(IOSFloatArray *)eqn
                 withJavaLangFloatArray:(IOSFloatArray *)res {
  float d = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:3];
  if (d == 0) {
    return [PythagorasFCrossing solveQuadWithJavaLangFloatArray:eqn withJavaLangFloatArray:res];
  }
  float a = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:2] / d;
  float b = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:1] / d;
  float c = [((IOSFloatArray *) NIL_CHK(eqn)) floatAtIndex:0] / d;
  int rc = 0;
  float Q = (a * a - 3.0f * b) / 9.0f;
  float R = (2.0f * a * a * a - 9.0f * a * b + 27.0f * c) / 54.0f;
  float Q3 = Q * Q * Q;
  float R2 = R * R;
  float n = -a / 3.0f;
  if (R2 < Q3) {
    float t = [PythagorasFFloatMath acosWithFloat:R / [PythagorasFFloatMath sqrtWithFloat:Q3]] / 3.0f;
    float p = 2.0f * PythagorasFFloatMath_PI / 3.0f;
    float m = -2.0f * [PythagorasFFloatMath sqrtWithFloat:Q];
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:m * [PythagorasFFloatMath cosWithFloat:t] + n];
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:m * [PythagorasFFloatMath cosWithFloat:t + p] + n];
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:m * [PythagorasFFloatMath cosWithFloat:t - p] + n];
  }
  else {
    float A = [PythagorasFFloatMath powWithFloat:[JavaLangMath absWithFloat:R] + [PythagorasFFloatMath sqrtWithFloat:R2 - Q3] withFloat:1.0f / 3.0f];
    if (R > 0.0f) {
      A = -A;
    }
    if (-PythagorasFCrossing_ROOT_DELTA < A && A < PythagorasFCrossing_ROOT_DELTA) {
      [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:n];
    }
    else {
      float B = Q / A;
      [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:A + B + n];
      float delta = R2 - Q3;
      if (-PythagorasFCrossing_ROOT_DELTA < delta && delta < PythagorasFCrossing_ROOT_DELTA) {
        [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:-(A + B) / 2.0f + n];
      }
    }
  }
  return [PythagorasFCrossing fixRootsWithJavaLangFloatArray:res withInt:rc];
}

+ (int)fixRootsWithJavaLangFloatArray:(IOSFloatArray *)res
                              withInt:(int)rc {
  int tc = 0;
  for (int i = 0; i < rc; i++) {
    out: {
      for (int j = i + 1; j < rc; j++) {
        if ([PythagorasFCrossing isZeroWithFloat:[((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i] - [((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:j]]) {
          goto out;
        }
      }
      [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:tc++ withFloat:[((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i]];
    }
  }
  return tc;
}

+ (int)crossLineWithFloat:(float)x1
                withFloat:(float)y1
                withFloat:(float)x2
                withFloat:(float)y2
                withFloat:(float)x
                withFloat:(float)y {
  if ((x < x1 && x < x2) || (x > x1 && x > x2) || (y > y1 && y > y2) || (x1 == x2)) {
    return 0;
  }
  if (y < y1 && y < y2) {
  }
  else {
    if ((y2 - y1) * (x - x1) / (x2 - x1) <= y - y1) {
      return 0;
    }
  }
  if (x == x1) {
    return x1 < x2 ? 0 : -1;
  }
  if (x == x2) {
    return x1 < x2 ? 1 : 0;
  }
  return x1 < x2 ? 1 : -1;
}

+ (int)crossQuadWithFloat:(float)x1
                withFloat:(float)y1
                withFloat:(float)cx
                withFloat:(float)cy
                withFloat:(float)x2
                withFloat:(float)y2
                withFloat:(float)x
                withFloat:(float)y {
  if ((x < x1 && x < cx && x < x2) || (x > x1 && x > cx && x > x2) || (y > y1 && y > cy && y > y2) || (x1 == cx && cx == x2)) {
    return 0;
  }
  if (y < y1 && y < cy && y < y2 && x != x1 && x != x2) {
    if (x1 < x2) {
      return x1 < x && x < x2 ? 1 : 0;
    }
    return x2 < x && x < x1 ? -1 : 0;
  }
  PythagorasFCrossing_QuadCurve *c = [[[PythagorasFCrossing_QuadCurve alloc] initWithFloat:x1 withFloat:y1 withFloat:cx withFloat:cy withFloat:x2 withFloat:y2] autorelease];
  float px = x - x1, py = y - y1;
  IOSFloatArray *res = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  int rc = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res withFloat:px];
  return [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) crossWithJavaLangFloatArray:res withInt:rc withFloat:py withFloat:py];
}

+ (int)crossCubicWithFloat:(float)x1
                 withFloat:(float)y1
                 withFloat:(float)cx1
                 withFloat:(float)cy1
                 withFloat:(float)cx2
                 withFloat:(float)cy2
                 withFloat:(float)x2
                 withFloat:(float)y2
                 withFloat:(float)x
                 withFloat:(float)y {
  if ((x < x1 && x < cx1 && x < cx2 && x < x2) || (x > x1 && x > cx1 && x > cx2 && x > x2) || (y > y1 && y > cy1 && y > cy2 && y > y2) || (x1 == cx1 && cx1 == cx2 && cx2 == x2)) {
    return 0;
  }
  if (y < y1 && y < cy1 && y < cy2 && y < y2 && x != x1 && x != x2) {
    if (x1 < x2) {
      return x1 < x && x < x2 ? 1 : 0;
    }
    return x2 < x && x < x1 ? -1 : 0;
  }
  PythagorasFCrossing_CubicCurveH *c = [[[PythagorasFCrossing_CubicCurveH alloc] initWithFloat:x1 withFloat:y1 withFloat:cx1 withFloat:cy1 withFloat:cx2 withFloat:cy2 withFloat:x2 withFloat:y2] autorelease];
  float px = x - x1, py = y - y1;
  IOSFloatArray *res = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  int rc = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res withFloat:px];
  return [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) crossWithJavaLangFloatArray:res withInt:rc withFloat:py withFloat:py];
}

+ (int)crossPathWithPythagorasFPathIterator:(id<PythagorasFPathIterator>)p
                                  withFloat:(float)x
                                  withFloat:(float)y {
  int cross = 0;
  float mx, my, cx, cy;
  mx = my = cx = cy = 0.0f;
  IOSFloatArray *coords = [[[IOSFloatArray alloc] initWithLength:6] autorelease];
  while (![((id<PythagorasFPathIterator>) NIL_CHK(p)) isDone]) {
    switch ([((id<PythagorasFPathIterator>) NIL_CHK(p)) currentSegmentWithJavaLangFloatArray:coords]) {
      case PythagorasFPathIterator_SEG_MOVETO:
      if (cx != mx || cy != my) {
        cross += [PythagorasFCrossing crossLineWithFloat:cx withFloat:cy withFloat:mx withFloat:my withFloat:x withFloat:y];
      }
      mx = cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0];
      my = cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1];
      break;
      case PythagorasFPathIterator_SEG_LINETO:
      cross += [PythagorasFCrossing crossLineWithFloat:cx withFloat:cy withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:x withFloat:y];
      break;
      case PythagorasFPathIterator_SEG_QUADTO:
      cross += [PythagorasFCrossing crossQuadWithFloat:cx withFloat:cy withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:2] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:3] withFloat:x withFloat:y];
      break;
      case PythagorasFPathIterator_SEG_CUBICTO:
      cross += [PythagorasFCrossing crossCubicWithFloat:cx withFloat:cy withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:2] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:3] withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:4] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:5] withFloat:x withFloat:y];
      break;
      case PythagorasFPathIterator_SEG_CLOSE:
      if (cy != my || cx != mx) {
        cross += [PythagorasFCrossing crossLineWithFloat:cx withFloat:cy withFloat:cx = mx withFloat:cy = my withFloat:x withFloat:y];
      }
      break;
    }
    if (x == cx && y == cy) {
      cross = 0;
      cy = my;
      break;
    }
    [((id<PythagorasFPathIterator>) NIL_CHK(p)) next];
  }
  if (cy != my) {
    cross += [PythagorasFCrossing crossLineWithFloat:cx withFloat:cy withFloat:mx withFloat:my withFloat:x withFloat:y];
  }
  return cross;
}

+ (int)crossShapeWithPythagorasFIShape:(id<PythagorasFIShape>)s
                             withFloat:(float)x
                             withFloat:(float)y {
  if (![[((id<PythagorasFIShape>) NIL_CHK(s)) bounds] containsWithFloat:x withFloat:y]) {
    return 0;
  }
  return [PythagorasFCrossing crossPathWithPythagorasFPathIterator:[((id<PythagorasFIShape>) NIL_CHK(s)) pathIteratorWithPythagorasFTransform:nil] withFloat:x withFloat:y];
}

+ (BOOL)isZeroWithFloat:(float)val {
  return -PythagorasFCrossing_DELTA < val && val < PythagorasFCrossing_DELTA;
}

+ (int)intersectLineWithFloat:(float)x1
                    withFloat:(float)y1
                    withFloat:(float)x2
                    withFloat:(float)y2
                    withFloat:(float)rx1
                    withFloat:(float)ry1
                    withFloat:(float)rx2
                    withFloat:(float)ry2 {
  if ((rx2 < x1 && rx2 < x2) || (rx1 > x1 && rx1 > x2) || (ry1 > y1 && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < y2) {
  }
  else {
    if (x1 == x2) {
      return PythagorasFCrossing_CROSSING;
    }
    float bx1, bx2;
    if (x1 < x2) {
      bx1 = x1 < rx1 ? rx1 : x1;
      bx2 = x2 < rx2 ? x2 : rx2;
    }
    else {
      bx1 = x2 < rx1 ? rx1 : x2;
      bx2 = x1 < rx2 ? x1 : rx2;
    }
    float k = (y2 - y1) / (x2 - x1);
    float by1 = k * (bx1 - x1) + y1;
    float by2 = k * (bx2 - x1) + y1;
    if (by1 < ry1 && by2 < ry1) {
      return 0;
    }
    if (by1 > ry2 && by2 > ry2) {
    }
    else {
      return PythagorasFCrossing_CROSSING;
    }
  }
  if (x1 == x2) {
    return 0;
  }
  if (rx1 == x1) {
    return x1 < x2 ? 0 : -1;
  }
  if (rx1 == x2) {
    return x1 < x2 ? 1 : 0;
  }
  if (x1 < x2) {
    return x1 < rx1 && rx1 < x2 ? 1 : 0;
  }
  return x2 < rx1 && rx1 < x1 ? -1 : 0;
}

+ (int)intersectQuadWithFloat:(float)x1
                    withFloat:(float)y1
                    withFloat:(float)cx
                    withFloat:(float)cy
                    withFloat:(float)x2
                    withFloat:(float)y2
                    withFloat:(float)rx1
                    withFloat:(float)ry1
                    withFloat:(float)rx2
                    withFloat:(float)ry2 {
  if ((rx2 < x1 && rx2 < cx && rx2 < x2) || (rx1 > x1 && rx1 > cx && rx1 > x2) || (ry1 > y1 && ry1 > cy && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < cy && ry2 < y2 && rx1 != x1 && rx1 != x2) {
    if (x1 < x2) {
      return x1 < rx1 && rx1 < x2 ? 1 : 0;
    }
    return x2 < rx1 && rx1 < x1 ? -1 : 0;
  }
  PythagorasFCrossing_QuadCurve *c = [[[PythagorasFCrossing_QuadCurve alloc] initWithFloat:x1 withFloat:y1 withFloat:cx withFloat:cy withFloat:x2 withFloat:y2] autorelease];
  float px1 = rx1 - x1;
  float py1 = ry1 - y1;
  float px2 = rx2 - x1;
  float py2 = ry2 - y1;
  IOSFloatArray *res1 = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  IOSFloatArray *res2 = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  int rc1 = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res1 withFloat:px1];
  int rc2 = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res2 withFloat:px2];
  if (rc1 == 0 && rc2 == 0) {
    return 0;
  }
  float minX = px1 - PythagorasFCrossing_DELTA;
  float maxX = px2 + PythagorasFCrossing_DELTA;
  IOSFloatArray *bound = [[[IOSFloatArray alloc] initWithLength:28] autorelease];
  int bc = 0;
  bc = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res1 withInt:rc1 withFloat:minX withFloat:maxX withBOOL:NO withInt:0];
  bc = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res2 withInt:rc2 withFloat:minX withFloat:maxX withBOOL:NO withInt:1];
  rc2 = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) solveExtremeWithJavaLangFloatArray:res2];
  bc = [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res2 withInt:rc2 withFloat:minX withFloat:maxX withBOOL:YES withInt:2];
  if (rx1 < x1 && x1 < rx2) {
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:4];
  }
  if (rx1 < x2 && x2 < rx2) {
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:1.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)).ax];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)).ay];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:5];
  }
  int cross = [PythagorasFCrossing crossBoundWithJavaLangFloatArray:bound withInt:bc withFloat:py1 withFloat:py2];
  if (cross != PythagorasFCrossing_UNKNOWN) {
    return cross;
  }
  return [((PythagorasFCrossing_QuadCurve *) NIL_CHK(c)) crossWithJavaLangFloatArray:res1 withInt:rc1 withFloat:py1 withFloat:py2];
}

+ (int)intersectCubicWithFloat:(float)x1
                     withFloat:(float)y1
                     withFloat:(float)cx1
                     withFloat:(float)cy1
                     withFloat:(float)cx2
                     withFloat:(float)cy2
                     withFloat:(float)x2
                     withFloat:(float)y2
                     withFloat:(float)rx1
                     withFloat:(float)ry1
                     withFloat:(float)rx2
                     withFloat:(float)ry2 {
  if ((rx2 < x1 && rx2 < cx1 && rx2 < cx2 && rx2 < x2) || (rx1 > x1 && rx1 > cx1 && rx1 > cx2 && rx1 > x2) || (ry1 > y1 && ry1 > cy1 && ry1 > cy2 && ry1 > y2)) {
    return 0;
  }
  if (ry2 < y1 && ry2 < cy1 && ry2 < cy2 && ry2 < y2 && rx1 != x1 && rx1 != x2) {
    if (x1 < x2) {
      return x1 < rx1 && rx1 < x2 ? 1 : 0;
    }
    return x2 < rx1 && rx1 < x1 ? -1 : 0;
  }
  PythagorasFCrossing_CubicCurveH *c = [[[PythagorasFCrossing_CubicCurveH alloc] initWithFloat:x1 withFloat:y1 withFloat:cx1 withFloat:cy1 withFloat:cx2 withFloat:cy2 withFloat:x2 withFloat:y2] autorelease];
  float px1 = rx1 - x1;
  float py1 = ry1 - y1;
  float px2 = rx2 - x1;
  float py2 = ry2 - y1;
  IOSFloatArray *res1 = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  IOSFloatArray *res2 = [[[IOSFloatArray alloc] initWithLength:3] autorelease];
  int rc1 = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res1 withFloat:px1];
  int rc2 = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) solvePointWithJavaLangFloatArray:res2 withFloat:px2];
  if (rc1 == 0 && rc2 == 0) {
    return 0;
  }
  float minX = px1 - PythagorasFCrossing_DELTA;
  float maxX = px2 + PythagorasFCrossing_DELTA;
  IOSFloatArray *bound = [[[IOSFloatArray alloc] initWithLength:40] autorelease];
  int bc = 0;
  bc = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res1 withInt:rc1 withFloat:minX withFloat:maxX withBOOL:NO withInt:0];
  bc = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res2 withInt:rc2 withFloat:minX withFloat:maxX withBOOL:NO withInt:1];
  rc2 = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) solveExtremeXWithJavaLangFloatArray:res2];
  bc = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res2 withInt:rc2 withFloat:minX withFloat:maxX withBOOL:YES withInt:2];
  rc2 = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) solveExtremeYWithJavaLangFloatArray:res2];
  bc = [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) addBoundWithJavaLangFloatArray:bound withInt:bc withJavaLangFloatArray:res2 withInt:rc2 withFloat:minX withFloat:maxX withBOOL:YES withInt:4];
  if (rx1 < x1 && x1 < rx2) {
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:0.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:6];
  }
  if (rx1 < x2 && x2 < rx2) {
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:1.0f];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)).ax];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)).ay];
    [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:7];
  }
  int cross = [PythagorasFCrossing crossBoundWithJavaLangFloatArray:bound withInt:bc withFloat:py1 withFloat:py2];
  if (cross != PythagorasFCrossing_UNKNOWN) {
    return cross;
  }
  return [((PythagorasFCrossing_CubicCurveH *) NIL_CHK(c)) crossWithJavaLangFloatArray:res1 withInt:rc1 withFloat:py1 withFloat:py2];
}

+ (int)intersectPathWithPythagorasFPathIterator:(id<PythagorasFPathIterator>)p
                                      withFloat:(float)x
                                      withFloat:(float)y
                                      withFloat:(float)w
                                      withFloat:(float)h {
  int cross = 0;
  int count;
  float mx, my, cx, cy;
  mx = my = cx = cy = 0.0f;
  IOSFloatArray *coords = [[[IOSFloatArray alloc] initWithLength:6] autorelease];
  float rx1 = x;
  float ry1 = y;
  float rx2 = x + w;
  float ry2 = y + h;
  while (![((id<PythagorasFPathIterator>) NIL_CHK(p)) isDone]) {
    count = 0;
    switch ([((id<PythagorasFPathIterator>) NIL_CHK(p)) currentSegmentWithJavaLangFloatArray:coords]) {
      case PythagorasFPathIterator_SEG_MOVETO:
      if (cx != mx || cy != my) {
        count = [PythagorasFCrossing intersectLineWithFloat:cx withFloat:cy withFloat:mx withFloat:my withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
      }
      mx = cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0];
      my = cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1];
      break;
      case PythagorasFPathIterator_SEG_LINETO:
      count = [PythagorasFCrossing intersectLineWithFloat:cx withFloat:cy withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
      break;
      case PythagorasFPathIterator_SEG_QUADTO:
      count = [PythagorasFCrossing intersectQuadWithFloat:cx withFloat:cy withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:2] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:3] withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
      break;
      case PythagorasFPathIterator_SEG_CUBICTO:
      count = [PythagorasFCrossing intersectCubicWithFloat:cx withFloat:cy withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:0] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:1] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:2] withFloat:[((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:3] withFloat:cx = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:4] withFloat:cy = [((IOSFloatArray *) NIL_CHK(coords)) floatAtIndex:5] withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
      break;
      case PythagorasFPathIterator_SEG_CLOSE:
      if (cy != my || cx != mx) {
        count = [PythagorasFCrossing intersectLineWithFloat:cx withFloat:cy withFloat:mx withFloat:my withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
      }
      cx = mx;
      cy = my;
      break;
    }
    if (count == PythagorasFCrossing_CROSSING) {
      return PythagorasFCrossing_CROSSING;
    }
    cross += count;
    [((id<PythagorasFPathIterator>) NIL_CHK(p)) next];
  }
  if (cy != my) {
    count = [PythagorasFCrossing intersectLineWithFloat:cx withFloat:cy withFloat:mx withFloat:my withFloat:rx1 withFloat:ry1 withFloat:rx2 withFloat:ry2];
    if (count == PythagorasFCrossing_CROSSING) {
      return PythagorasFCrossing_CROSSING;
    }
    cross += count;
  }
  return cross;
}

+ (int)intersectShapeWithPythagorasFIShape:(id<PythagorasFIShape>)s
                                 withFloat:(float)x
                                 withFloat:(float)y
                                 withFloat:(float)w
                                 withFloat:(float)h {
  if (![[((id<PythagorasFIShape>) NIL_CHK(s)) bounds] intersectsWithFloat:x withFloat:y withFloat:w withFloat:h]) {
    return 0;
  }
  return [PythagorasFCrossing intersectPathWithPythagorasFPathIterator:[((id<PythagorasFIShape>) NIL_CHK(s)) pathIteratorWithPythagorasFTransform:nil] withFloat:x withFloat:y withFloat:w withFloat:h];
}

+ (BOOL)isInsideNonZeroWithInt:(int)cross {
  return cross != 0;
}

+ (BOOL)isInsideEvenOddWithInt:(int)cross {
  return (cross & 1) != 0;
}

+ (void)sortBoundWithJavaLangFloatArray:(IOSFloatArray *)bound
                                withInt:(int)bc {
  for (int i = 0; i < bc - 4; i += 4) {
    int k = i;
    for (int j = i + 4; j < bc; j += 4) {
      if ([((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:k] > [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:j]) {
        k = j;
      }
    }
    if (k != i) {
      float tmp = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:i withFloat:[((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:k]];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:k withFloat:tmp];
      tmp = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i + 1];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:i + 1 withFloat:[((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:k + 1]];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:k + 1 withFloat:tmp];
      tmp = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i + 2];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:i + 2 withFloat:[((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:k + 2]];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:k + 2 withFloat:tmp];
      tmp = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i + 3];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:i + 3 withFloat:[((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:k + 3]];
      [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:k + 3 withFloat:tmp];
    }
  }
}

+ (int)crossBoundWithJavaLangFloatArray:(IOSFloatArray *)bound
                                withInt:(int)bc
                              withFloat:(float)py1
                              withFloat:(float)py2 {
  if (bc == 0) {
    return 0;
  }
  int up = 0;
  int down = 0;
  for (int i = 2; i < bc; i += 4) {
    if ([((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i] < py1) {
      up++;
      continue;
    }
    if ([((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i] > py2) {
      down++;
      continue;
    }
    return PythagorasFCrossing_CROSSING;
  }
  if (down == 0) {
    return 0;
  }
  if (up != 0) {
    [PythagorasFCrossing sortBoundWithJavaLangFloatArray:bound withInt:bc];
    BOOL sign = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:2] > py2;
    for (int i = 6; i < bc; i += 4) {
      BOOL sign2 = [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i] > py2;
      if (sign != sign2 && [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i + 1] != [((IOSFloatArray *) NIL_CHK(bound)) floatAtIndex:i - 3]) {
        return PythagorasFCrossing_CROSSING;
      }
      sign = sign2;
    }
  }
  return PythagorasFCrossing_UNKNOWN;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PythagorasFCrossing_QuadCurve

@synthesize ax = ax_;
@synthesize ay = ay_;
@synthesize bx = bx_;
@synthesize by = by_;
@synthesize Ax = Ax_;
@synthesize Ay = Ay_;
@synthesize Bx = Bx_;
@synthesize By = By_;

- (id)initWithFloat:(float)x1
          withFloat:(float)y1
          withFloat:(float)cx
          withFloat:(float)cy
          withFloat:(float)x2
          withFloat:(float)y2 {
  if ((self = [super init])) {
    ax_ = x2 - x1;
    ay_ = y2 - y1;
    bx_ = cx - x1;
    by_ = cy - y1;
    Bx_ = bx_ + bx_;
    Ax_ = ax_ - Bx_;
    By_ = by_ + by_;
    Ay_ = ay_ - By_;
  }
  return self;
}

- (int)crossWithJavaLangFloatArray:(IOSFloatArray *)res
                           withInt:(int)rc
                         withFloat:(float)py1
                         withFloat:(float)py2 {
  int cross = 0;
  for (int i = 0; i < rc; i++) {
    float t = [((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i];
    if (t < -PythagorasFCrossing_DELTA || t > 1 + PythagorasFCrossing_DELTA) {
      continue;
    }
    if (t < PythagorasFCrossing_DELTA) {
      if (py1 < 0.0f && (bx_ != 0.0f ? bx_ : ax_ - bx_) < 0.0f) {
        cross--;
      }
      continue;
    }
    if (t > 1 - PythagorasFCrossing_DELTA) {
      if (py1 < ay_ && (ax_ != bx_ ? ax_ - bx_ : bx_) > 0.0f) {
        cross++;
      }
      continue;
    }
    float ry = t * (t * Ay_ + By_);
    if (ry > py2) {
      float rxt = t * Ax_ + bx_;
      if (rxt > -PythagorasFCrossing_DELTA && rxt < PythagorasFCrossing_DELTA) {
        continue;
      }
      cross += rxt > 0.0f ? 1 : -1;
    }
  }
  return cross;
}

- (int)solvePointWithJavaLangFloatArray:(IOSFloatArray *)res
                              withFloat:(float)px {
  IOSFloatArray *eqn = [IOSFloatArray arrayWithFloats:(float[]){ -px, Bx_, Ax_ } count:3];
  return [PythagorasFCrossing solveQuadWithJavaLangFloatArray:eqn withJavaLangFloatArray:res];
}

- (int)solveExtremeWithJavaLangFloatArray:(IOSFloatArray *)res {
  int rc = 0;
  if (Ax_ != 0.0f) {
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:-Bx_ / (Ax_ + Ax_)];
  }
  if (Ay_ != 0.0f) {
    [((IOSFloatArray *) NIL_CHK(res)) replaceFloatAtIndex:rc++ withFloat:-By_ / (Ay_ + Ay_)];
  }
  return rc;
}

- (int)addBoundWithJavaLangFloatArray:(IOSFloatArray *)bound
                              withInt:(int)bc
               withJavaLangFloatArray:(IOSFloatArray *)res
                              withInt:(int)rc
                            withFloat:(float)minX
                            withFloat:(float)maxX
                             withBOOL:(BOOL)changeId
                              withInt:(int)id_ {
  for (int i = 0; i < rc; i++) {
    float t = [((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i];
    if (t > -PythagorasFCrossing_DELTA && t < 1 + PythagorasFCrossing_DELTA) {
      float rx = t * (t * Ax_ + Bx_);
      if (minX <= rx && rx <= maxX) {
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:t];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:rx];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:t * (t * Ay_ + By_)];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:id_];
        if (changeId) {
          id_++;
        }
      }
    }
  }
  return bc;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFCrossing_QuadCurve *typedCopy = (PythagorasFCrossing_QuadCurve *) copy;
  typedCopy.ax = ax_;
  typedCopy.ay = ay_;
  typedCopy.bx = bx_;
  typedCopy.by = by_;
  typedCopy.Ax = Ax_;
  typedCopy.Ay = Ay_;
  typedCopy.Bx = Bx_;
  typedCopy.By = By_;
}

@end
@implementation PythagorasFCrossing_CubicCurveH

@synthesize ax = ax_;
@synthesize ay = ay_;
@synthesize bx = bx_;
@synthesize by = by_;
@synthesize cx = cx_;
@synthesize cy = cy_;
@synthesize Ax = Ax_;
@synthesize Ay = Ay_;
@synthesize Bx = Bx_;
@synthesize By = By_;
@synthesize Cx = Cx_;
@synthesize Cy = Cy_;
@synthesize Ax3 = Ax3_;
@synthesize Bx2 = Bx2_;

- (id)initWithFloat:(float)x1
          withFloat:(float)y1
          withFloat:(float)cx1
          withFloat:(float)cy1
          withFloat:(float)cx2
          withFloat:(float)cy2
          withFloat:(float)x2
          withFloat:(float)y2 {
  if ((self = [super init])) {
    ax_ = x2 - x1;
    ay_ = y2 - y1;
    bx_ = cx1 - x1;
    by_ = cy1 - y1;
    cx_ = cx2 - x1;
    cy_ = cy2 - y1;
    Cx_ = bx_ + bx_ + bx_;
    Bx_ = cx_ + cx_ + cx_ - Cx_ - Cx_;
    Ax_ = ax_ - Bx_ - Cx_;
    Cy_ = by_ + by_ + by_;
    By_ = cy_ + cy_ + cy_ - Cy_ - Cy_;
    Ay_ = ay_ - By_ - Cy_;
    Ax3_ = Ax_ + Ax_ + Ax_;
    Bx2_ = Bx_ + Bx_;
  }
  return self;
}

- (int)crossWithJavaLangFloatArray:(IOSFloatArray *)res
                           withInt:(int)rc
                         withFloat:(float)py1
                         withFloat:(float)py2 {
  int cross = 0;
  for (int i = 0; i < rc; i++) {
    float t = [((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i];
    if (t < -PythagorasFCrossing_DELTA || t > 1 + PythagorasFCrossing_DELTA) {
      continue;
    }
    if (t < PythagorasFCrossing_DELTA) {
      if (py1 < 0.0f && (bx_ != 0.0f ? bx_ : (cx_ != bx_ ? cx_ - bx_ : ax_ - cx_)) < 0.0f) {
        cross--;
      }
      continue;
    }
    if (t > 1 - PythagorasFCrossing_DELTA) {
      if (py1 < ay_ && (ax_ != cx_ ? ax_ - cx_ : (cx_ != bx_ ? cx_ - bx_ : bx_)) > 0.0f) {
        cross++;
      }
      continue;
    }
    float ry = t * (t * (t * Ay_ + By_) + Cy_);
    if (ry > py2) {
      float rxt = t * (t * Ax3_ + Bx2_) + Cx_;
      if (rxt > -PythagorasFCrossing_DELTA && rxt < PythagorasFCrossing_DELTA) {
        rxt = t * (Ax3_ + Ax3_) + Bx2_;
        if (rxt < -PythagorasFCrossing_DELTA || rxt > PythagorasFCrossing_DELTA) {
          continue;
        }
        rxt = ax_;
      }
      cross += rxt > 0.0f ? 1 : -1;
    }
  }
  return cross;
}

- (int)solvePointWithJavaLangFloatArray:(IOSFloatArray *)res
                              withFloat:(float)px {
  IOSFloatArray *eqn = [IOSFloatArray arrayWithFloats:(float[]){ -px, Cx_, Bx_, Ax_ } count:4];
  return [PythagorasFCrossing solveCubicWithJavaLangFloatArray:eqn withJavaLangFloatArray:res];
}

- (int)solveExtremeXWithJavaLangFloatArray:(IOSFloatArray *)res {
  IOSFloatArray *eqn = [IOSFloatArray arrayWithFloats:(float[]){ Cx_, Bx2_, Ax3_ } count:3];
  return [PythagorasFCrossing solveQuadWithJavaLangFloatArray:eqn withJavaLangFloatArray:res];
}

- (int)solveExtremeYWithJavaLangFloatArray:(IOSFloatArray *)res {
  IOSFloatArray *eqn = [IOSFloatArray arrayWithFloats:(float[]){ Cy_, By_ + By_, Ay_ + Ay_ + Ay_ } count:3];
  return [PythagorasFCrossing solveQuadWithJavaLangFloatArray:eqn withJavaLangFloatArray:res];
}

- (int)addBoundWithJavaLangFloatArray:(IOSFloatArray *)bound
                              withInt:(int)bc
               withJavaLangFloatArray:(IOSFloatArray *)res
                              withInt:(int)rc
                            withFloat:(float)minX
                            withFloat:(float)maxX
                             withBOOL:(BOOL)changeId
                              withInt:(int)id_ {
  for (int i = 0; i < rc; i++) {
    float t = [((IOSFloatArray *) NIL_CHK(res)) floatAtIndex:i];
    if (t > -PythagorasFCrossing_DELTA && t < 1 + PythagorasFCrossing_DELTA) {
      float rx = t * (t * (t * Ax_ + Bx_) + Cx_);
      if (minX <= rx && rx <= maxX) {
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:t];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:rx];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:t * (t * (t * Ay_ + By_) + Cy_)];
        [((IOSFloatArray *) NIL_CHK(bound)) replaceFloatAtIndex:bc++ withFloat:id_];
        if (changeId) {
          id_++;
        }
      }
    }
  }
  return bc;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasFCrossing_CubicCurveH *typedCopy = (PythagorasFCrossing_CubicCurveH *) copy;
  typedCopy.ax = ax_;
  typedCopy.ay = ay_;
  typedCopy.bx = bx_;
  typedCopy.by = by_;
  typedCopy.cx = cx_;
  typedCopy.cy = cy_;
  typedCopy.Ax = Ax_;
  typedCopy.Ay = Ay_;
  typedCopy.Bx = Bx_;
  typedCopy.By = By_;
  typedCopy.Cx = Cx_;
  typedCopy.Cy = Cy_;
  typedCopy.Ax3 = Ax3_;
  typedCopy.Bx2 = Bx2_;
}

@end
