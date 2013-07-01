//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/AbstractCircle.java
//
//  Created by Thomas on 7/1/13.
//

#import "pythagoras/f/Circle.h"
#import "pythagoras/f/ICircle.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/Points.h"
#import "pythagoras/util/Platform.h"

@implementation PythagorasFAbstractCircle

- (BOOL)intersectsWithPythagorasFICircle:(id<PythagorasFICircle>)c {
  float maxDist = [self radius] + [((id<PythagorasFICircle>) NIL_CHK(c)) radius];
  return [PythagorasFPoints distanceSqWithFloat:[self x] withFloat:[self y] withFloat:[((id<PythagorasFICircle>) NIL_CHK(c)) x] withFloat:[((id<PythagorasFICircle>) NIL_CHK(c)) y]] < (maxDist * maxDist);
}

- (BOOL)containsWithPythagorasFIPoint:(id<PythagorasFIPoint>)p {
  float r = [self radius];
  return [PythagorasFPoints distanceSqWithFloat:[self x] withFloat:[self y] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) x] withFloat:[((id<PythagorasFIPoint>) NIL_CHK(p)) y]] < r * r;
}

- (BOOL)containsWithFloat:(float)x
                withFloat:(float)y {
  float r = [self radius];
  return [PythagorasFPoints distanceSqWithFloat:[self x] withFloat:[self y] withFloat:x withFloat:y] < r * r;
}

- (PythagorasFCircle *)offsetWithFloat:(float)x
                             withFloat:(float)y {
  return [[[PythagorasFCircle alloc] initWithFloat:[self x] + x withFloat:[self y] + y withFloat:[self radius]] autorelease];
}

- (PythagorasFCircle *)offsetWithFloat:(float)x
                             withFloat:(float)y
                 withPythagorasFCircle:(PythagorasFCircle *)result {
  (void) [((PythagorasFCircle *) NIL_CHK(result)) setWithFloat:[self x] + x withFloat:[self y] + y withFloat:[self radius]];
  return result;
}

- (PythagorasFCircle *)clone {
  return [[[PythagorasFCircle alloc] initWithPythagorasFICircle:self] autorelease];
}

- (BOOL)isEqual:(id)obj {
  if (obj == self) {
    return YES;
  }
  if ([obj isKindOfClass:[PythagorasFAbstractCircle class]]) {
    PythagorasFAbstractCircle *c = (PythagorasFAbstractCircle *) obj;
    return [self x] == [((PythagorasFAbstractCircle *) NIL_CHK(c)) x] && [self y] == [((PythagorasFAbstractCircle *) NIL_CHK(c)) y] && [self radius] == [((PythagorasFAbstractCircle *) NIL_CHK(c)) radius];
  }
  return NO;
}

- (NSUInteger)hash {
  return [PythagorasUtilPlatform hashCodeWithFloat:[self x]] ^ [PythagorasUtilPlatform hashCodeWithFloat:[self y]] ^ [PythagorasUtilPlatform hashCodeWithFloat:[self radius]];
}

- (float)radius {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)x {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (float)y {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
