//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Vector4.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSDoubleArray.h"
#import "java/lang/Math.h"
#import "java/nio/DoubleBuffer.h"
#import "pythagoras/d/IMatrix4.h"
#import "pythagoras/d/IVector4.h"
#import "pythagoras/util/Platform.h"

@implementation PythagorasDVector4

@synthesize x_ = x__;
@synthesize y_ = y__;
@synthesize z_ = z__;
@synthesize w_ = w__;

- (id)initWithDouble:(double)x
          withDouble:(double)y
          withDouble:(double)z
          withDouble:(double)w {
  if ((self = [super init])) {
    (void) [self setWithDouble:x withDouble:y withDouble:z withDouble:w];
  }
  return self;
}

- (id)initWithJavaLangDoubleArray:(IOSDoubleArray *)values {
  if ((self = [super init])) {
    (void) [self setWithJavaLangDoubleArray:values];
  }
  return self;
}

- (id)initWithJavaNioDoubleBuffer:(JavaNioDoubleBuffer *)buf {
  if ((self = [super init])) {
    (void) [self setWithJavaNioDoubleBuffer:buf];
  }
  return self;
}

- (id)initWithPythagorasDIVector4:(id<PythagorasDIVector4>)other {
  if ((self = [super init])) {
    (void) [self setWithPythagorasDIVector4:other];
  }
  return self;
}

- (id)init {
  return [super init];
}

- (PythagorasDVector4 *)setWithPythagorasDIVector4:(id<PythagorasDIVector4>)other {
  return [self setWithDouble:[((id<PythagorasDIVector4>) NIL_CHK(other)) x] withDouble:[((id<PythagorasDIVector4>) NIL_CHK(other)) y] withDouble:[((id<PythagorasDIVector4>) NIL_CHK(other)) z] withDouble:[((id<PythagorasDIVector4>) NIL_CHK(other)) w]];
}

- (PythagorasDVector4 *)setWithJavaLangDoubleArray:(IOSDoubleArray *)values {
  return [self setWithDouble:[((IOSDoubleArray *) NIL_CHK(values)) doubleAtIndex:0] withDouble:[((IOSDoubleArray *) NIL_CHK(values)) doubleAtIndex:1] withDouble:[((IOSDoubleArray *) NIL_CHK(values)) doubleAtIndex:2] withDouble:[((IOSDoubleArray *) NIL_CHK(values)) doubleAtIndex:3]];
}

- (PythagorasDVector4 *)setWithJavaNioDoubleBuffer:(JavaNioDoubleBuffer *)buf {
  return [self setWithDouble:[((JavaNioDoubleBuffer *) NIL_CHK(buf)) get] withDouble:[((JavaNioDoubleBuffer *) NIL_CHK(buf)) get] withDouble:[((JavaNioDoubleBuffer *) NIL_CHK(buf)) get] withDouble:[((JavaNioDoubleBuffer *) NIL_CHK(buf)) get]];
}

- (PythagorasDVector4 *)setWithDouble:(double)x
                           withDouble:(double)y
                           withDouble:(double)z
                           withDouble:(double)w {
  self.x_ = x;
  self.y_ = y;
  self.z_ = z;
  self.w_ = w;
  return self;
}

- (PythagorasDVector4 *)negateLocal {
  return [self negateWithPythagorasDVector4:self];
}

- (PythagorasDVector4 *)absLocal {
  return [self absWithPythagorasDVector4:self];
}

- (PythagorasDVector4 *)multLocalWithDouble:(double)v {
  return [self multWithDouble:v withPythagorasDVector4:self];
}

- (PythagorasDVector4 *)multLocalWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix {
  return [self multWithPythagorasDIMatrix4:matrix withPythagorasDVector4:self];
}

- (double)x {
  return x__;
}

- (double)y {
  return y__;
}

- (double)z {
  return z__;
}

- (double)w {
  return w__;
}

- (JavaNioDoubleBuffer *)getWithJavaNioDoubleBuffer:(JavaNioDoubleBuffer *)buf {
  return [[[[((JavaNioDoubleBuffer *) NIL_CHK(buf)) putWithDouble:x__] putWithDouble:y__] putWithDouble:z__] putWithDouble:w__];
}

- (BOOL)epsilonEqualsWithPythagorasDIVector4:(id<PythagorasDIVector4>)other
                                  withDouble:(double)epsilon {
  return ([JavaLangMath absWithDouble:x__ - [((id<PythagorasDIVector4>) NIL_CHK(other)) x]] < epsilon && [JavaLangMath absWithDouble:y__ - [((id<PythagorasDIVector4>) NIL_CHK(other)) y]] < epsilon && [JavaLangMath absWithDouble:z__ - [((id<PythagorasDIVector4>) NIL_CHK(other)) z]] < epsilon && [JavaLangMath absWithDouble:w__ - [((id<PythagorasDIVector4>) NIL_CHK(other)) w]] < epsilon);
}

- (PythagorasDVector4 *)negate {
  return [self negateWithPythagorasDVector4:[[[PythagorasDVector4 alloc] init] autorelease]];
}

- (PythagorasDVector4 *)negateWithPythagorasDVector4:(PythagorasDVector4 *)result {
  return [((PythagorasDVector4 *) NIL_CHK(result)) setWithDouble:-x__ withDouble:-y__ withDouble:-z__ withDouble:-w__];
}

- (PythagorasDVector4 *)abs {
  return [self absWithPythagorasDVector4:[[[PythagorasDVector4 alloc] init] autorelease]];
}

- (PythagorasDVector4 *)absWithPythagorasDVector4:(PythagorasDVector4 *)result {
  return [((PythagorasDVector4 *) NIL_CHK(result)) setWithDouble:[JavaLangMath absWithDouble:x__] withDouble:[JavaLangMath absWithDouble:y__] withDouble:[JavaLangMath absWithDouble:z__] withDouble:[JavaLangMath absWithDouble:w__]];
}

- (PythagorasDVector4 *)multWithDouble:(double)v {
  return [self multWithDouble:v withPythagorasDVector4:[[[PythagorasDVector4 alloc] init] autorelease]];
}

- (PythagorasDVector4 *)multWithDouble:(double)v
                withPythagorasDVector4:(PythagorasDVector4 *)result {
  return [((PythagorasDVector4 *) NIL_CHK(result)) setWithDouble:x__ * v withDouble:y__ * v withDouble:z__ * v withDouble:w__ * v];
}

- (PythagorasDVector4 *)multWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix {
  return [self multWithPythagorasDIMatrix4:matrix withPythagorasDVector4:[[[PythagorasDVector4 alloc] init] autorelease]];
}

- (PythagorasDVector4 *)multWithPythagorasDIMatrix4:(id<PythagorasDIMatrix4>)matrix
                             withPythagorasDVector4:(PythagorasDVector4 *)result {
  double m00 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m00], m10 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m10], m20 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m20], m30 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m30];
  double m01 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m01], m11 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m11], m21 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m21], m31 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m31];
  double m02 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m02], m12 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m12], m22 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m22], m32 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m32];
  double m03 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m03], m13 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m13], m23 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m23], m33 = [((id<PythagorasDIMatrix4>) NIL_CHK(matrix)) m33];
  double vx = x__, vy = y__, vz = z__, vw = w__;
  return [((PythagorasDVector4 *) NIL_CHK(result)) setWithDouble:m00 * vx + m01 * vy + m02 * vz + m03 * vw withDouble:m10 * vx + m11 * vy + m12 * vz + m13 * vw withDouble:m20 * vx + m21 * vy + m22 * vz + m23 * vw withDouble:m30 * vx + m31 * vy + m32 * vz + m33 * vw];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"[%f, %f, %f, %f]", x__, y__, z__, w__];
}

- (NSUInteger)hash {
  return [PythagorasUtilPlatform hashCodeWithDouble:x__] ^ [PythagorasUtilPlatform hashCodeWithDouble:y__] ^ [PythagorasUtilPlatform hashCodeWithDouble:z__] ^ [PythagorasUtilPlatform hashCodeWithDouble:w__];
}

- (BOOL)isEqual:(id)other {
  if (!([other isKindOfClass:[PythagorasDVector4 class]])) {
    return NO;
  }
  PythagorasDVector4 *ovec = (PythagorasDVector4 *) other;
  return (x__ == ((PythagorasDVector4 *) NIL_CHK(ovec)).x_ && y__ == ((PythagorasDVector4 *) NIL_CHK(ovec)).y_ && z__ == ((PythagorasDVector4 *) NIL_CHK(ovec)).z_ && w__ == ((PythagorasDVector4 *) NIL_CHK(ovec)).w_);
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDVector4 *typedCopy = (PythagorasDVector4 *) copy;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
  typedCopy.z_ = z__;
  typedCopy.w_ = w__;
}

@end
