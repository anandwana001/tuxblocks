//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/bgs/Scale9Background.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSFloatArray.h"
#import "java/lang/Float.h"
#import "playn/core/Image.h"
#import "playn/core/Log.h"
#import "playn/core/PlayN.h"
#import "playn/core/Surface.h"
#import "pythagoras/f/IDimension.h"
#import "tripleplay/ui/Background.h"

@implementation TripleplayUiBgsScale9Background

- (TripleplayUiBgsScale9Background_Axis3 *)xaxis {
  return xaxis_;
}
- (void)setXaxis:(TripleplayUiBgsScale9Background_Axis3 *)xaxis {
  JreOperatorRetainedAssign(&xaxis_, self, xaxis);
}
@synthesize xaxis = xaxis_;
- (TripleplayUiBgsScale9Background_Axis3 *)yaxis {
  return yaxis_;
}
- (void)setYaxis:(TripleplayUiBgsScale9Background_Axis3 *)yaxis {
  JreOperatorRetainedAssign(&yaxis_, self, yaxis);
}
@synthesize yaxis = yaxis_;
- (id<PlaynCoreImage>)_image {
  return _image_;
}
- (void)set_image:(id<PlaynCoreImage>)_image {
  JreOperatorRetainedAssign(&_image_, self, _image);
}
@synthesize _image = _image_;

- (id)initWithPlaynCoreImage:(id<PlaynCoreImage>)image {
  if ((self = [super init])) {
    if (![((id<PlaynCoreImage>) NIL_CHK(image)) isReady]) {
      [((id<PlaynCoreLog>) [PlaynCorePlayN log]) warnWithNSString:[NSString stringWithFormat:@"Scale9 image not preloaded: %@", image]];
    }
    JreOperatorRetainedAssign(&_image_, self, image);
    JreOperatorRetainedAssign(&xaxis_, self, [[[TripleplayUiBgsScale9Background_Axis3 alloc] initWithFloat:[((id<PlaynCoreImage>) NIL_CHK(image)) width]] autorelease]);
    JreOperatorRetainedAssign(&yaxis_, self, [[[TripleplayUiBgsScale9Background_Axis3 alloc] initWithFloat:[((id<PlaynCoreImage>) NIL_CHK(image)) height]] autorelease]);
  }
  return self;
}

- (TripleplayUiBackground_Instance *)instantiateWithPythagorasFIDimension:(id<PythagorasFIDimension>)size {
  return [[[TripleplayUiBackground_LayerInstance alloc] initWithTripleplayUiBackground:self withPythagorasFIDimension:size withPlaynCoreImmediateLayer_Renderer:[[[TripleplayUiBgsScale9Background_$1 alloc] initWithTripleplayUiBgsScale9Background:self withPythagorasFIDimension:size] autorelease]] autorelease];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_image_, self, nil);
  JreOperatorRetainedAssign(&yaxis_, self, nil);
  JreOperatorRetainedAssign(&xaxis_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUiBgsScale9Background *typedCopy = (TripleplayUiBgsScale9Background *) copy;
  typedCopy.xaxis = xaxis_;
  typedCopy.yaxis = yaxis_;
  typedCopy._image = _image_;
}

@end
@implementation TripleplayUiBgsScale9Background_Axis3

- (IOSFloatArray *)_offsets {
  return _offsets_;
}
- (void)set_offsets:(IOSFloatArray *)_offsets {
  JreOperatorRetainedAssign(&_offsets_, self, _offsets);
}
@synthesize _offsets = _offsets_;
- (IOSFloatArray *)_lengths {
  return _lengths_;
}
- (void)set_lengths:(IOSFloatArray *)_lengths {
  JreOperatorRetainedAssign(&_lengths_, self, _lengths);
}
@synthesize _lengths = _lengths_;

- (id)initWithFloat:(float)length {
  if ((self = [super init])) {
    float d = length / 3;
    JreOperatorRetainedAssign(&_lengths_, self, [IOSFloatArray arrayWithFloats:(float[]){ d, length - 2 * d, d } count:3]);
    JreOperatorRetainedAssign(&_offsets_, self, [IOSFloatArray arrayWithFloats:(float[]){ 0, [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:0], [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:0] + [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:1] } count:3]);
  }
  return self;
}

- (id)initWithFloat:(float)length
withTripleplayUiBgsScale9Background_Axis3:(TripleplayUiBgsScale9Background_Axis3 *)src {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&_lengths_, self, [IOSFloatArray arrayWithFloats:(float[]){ [((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(src)) sizeWithInt:0], length - [((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(src)) sizeWithInt:0] - [((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(src)) sizeWithInt:2], [((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(src)) sizeWithInt:2] } count:3]);
    JreOperatorRetainedAssign(&_offsets_, self, [IOSFloatArray arrayWithFloats:(float[]){ 0, [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:0], [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:0] + [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:1] } count:3]);
  }
  return self;
}

- (float)coordWithInt:(int)idx {
  return [((IOSFloatArray *) NIL_CHK(_offsets_)) floatAtIndex:idx];
}

- (float)sizeWithInt:(int)idx {
  return [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:idx];
}

- (TripleplayUiBgsScale9Background_Axis3 *)setWithInt:(int)idx
                                            withFloat:(float)coord
                                            withFloat:(float)size {
  [((IOSFloatArray *) NIL_CHK(_offsets_)) replaceFloatAtIndex:idx withFloat:coord];
  [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:idx withFloat:size];
  return self;
}

- (TripleplayUiBgsScale9Background_Axis3 *)resizeWithInt:(int)idx
                                               withFloat:(float)size {
  float excess = [((IOSFloatArray *) NIL_CHK(_lengths_)) floatAtIndex:idx] - size;
  [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:idx withFloat:size];
  {
    float half;
    switch (idx) {
      case 0:
      [((IOSFloatArray *) NIL_CHK(_offsets_)) replaceFloatAtIndex:1 withFloat:[_offsets_ floatAtIndex:1] - excess];
      [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:1 withFloat:[_lengths_ floatAtIndex:1] + excess];
      break;
      case 1:
      half = excess * .5f;
      [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:0 withFloat:[_lengths_ floatAtIndex:0] + half];
      [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:2 withFloat:[_lengths_ floatAtIndex:2] + half];
      [((IOSFloatArray *) NIL_CHK(_offsets_)) replaceFloatAtIndex:1 withFloat:[_offsets_ floatAtIndex:1] + half];
      [((IOSFloatArray *) NIL_CHK(_offsets_)) replaceFloatAtIndex:2 withFloat:[_offsets_ floatAtIndex:2] - half];
      break;
      case 2:
      [((IOSFloatArray *) NIL_CHK(_offsets_)) replaceFloatAtIndex:2 withFloat:[_offsets_ floatAtIndex:2] - excess];
      [((IOSFloatArray *) NIL_CHK(_lengths_)) replaceFloatAtIndex:1 withFloat:[_lengths_ floatAtIndex:1] + excess];
      break;
    }
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_lengths_, self, nil);
  JreOperatorRetainedAssign(&_offsets_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUiBgsScale9Background_Axis3 *typedCopy = (TripleplayUiBgsScale9Background_Axis3 *) copy;
  typedCopy._offsets = _offsets_;
  typedCopy._lengths = _lengths_;
}

@end
@implementation TripleplayUiBgsScale9Background_$1

- (TripleplayUiBgsScale9Background *)this$0 {
  return this$0_;
}
- (void)setThis$0:(TripleplayUiBgsScale9Background *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (TripleplayUiBgsScale9Background_Axis3 *)dx {
  return dx_;
}
- (void)setDx:(TripleplayUiBgsScale9Background_Axis3 *)dx {
  JreOperatorRetainedAssign(&dx_, self, dx);
}
@synthesize dx = dx_;
- (TripleplayUiBgsScale9Background_Axis3 *)dy {
  return dy_;
}
- (void)setDy:(TripleplayUiBgsScale9Background_Axis3 *)dy {
  JreOperatorRetainedAssign(&dy_, self, dy);
}
@synthesize dy = dy_;
- (id<PythagorasFIDimension>)val$size {
  return val$size_;
}
- (void)setVal$size:(id<PythagorasFIDimension>)val$size {
  JreOperatorRetainedAssign(&val$size_, self, val$size);
}
@synthesize val$size = val$size_;

- (void)renderWithPlaynCoreSurface:(id<PlaynCoreSurface>)surf {
  (void) [((id<PlaynCoreSurface>) NIL_CHK(surf)) save];
  if (this$0_.alpha_ != nil) (void) [((id<PlaynCoreSurface>) NIL_CHK(surf)) setAlphaWithFloat:[this$0_.alpha_ floatValue]];
  for (int yy = 0; yy < 3; ++yy) for (int xx = 0; xx < 3; ++xx) {
    [self drawPartWithPlaynCoreSurface:surf withInt:xx withInt:yy];
  }
  if (this$0_.alpha_ != nil) (void) [((id<PlaynCoreSurface>) NIL_CHK(surf)) setAlphaWithFloat:1];
  (void) [((id<PlaynCoreSurface>) NIL_CHK(surf)) restore];
}

- (void)drawPartWithPlaynCoreSurface:(id<PlaynCoreSurface>)surf
                             withInt:(int)x
                             withInt:(int)y {
  if ([((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dx_)) sizeWithInt:x] == 0 || [((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dy_)) sizeWithInt:y] == 0) return;
  (void) [((id<PlaynCoreSurface>) NIL_CHK(surf)) drawImageWithPlaynCoreImage:this$0_._image withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dx_)) coordWithInt:x] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dy_)) coordWithInt:y] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dx_)) sizeWithInt:x] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(dy_)) sizeWithInt:y] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(this$0_.xaxis)) coordWithInt:x] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(this$0_.yaxis)) coordWithInt:y] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(this$0_.xaxis)) sizeWithInt:x] withFloat:[((TripleplayUiBgsScale9Background_Axis3 *) NIL_CHK(this$0_.yaxis)) sizeWithInt:y]];
}

- (id)initWithTripleplayUiBgsScale9Background:(TripleplayUiBgsScale9Background *)outer$
                    withPythagorasFIDimension:(id<PythagorasFIDimension>)capture$0 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$size_, self, capture$0);
    JreOperatorRetainedAssign(&dx_, self, [[[TripleplayUiBgsScale9Background_Axis3 alloc] initWithFloat:[((id<PythagorasFIDimension>) NIL_CHK(val$size_)) width] withTripleplayUiBgsScale9Background_Axis3:outer$.xaxis] autorelease]);
    JreOperatorRetainedAssign(&dy_, self, [[[TripleplayUiBgsScale9Background_Axis3 alloc] initWithFloat:[((id<PythagorasFIDimension>) NIL_CHK(val$size_)) height] withTripleplayUiBgsScale9Background_Axis3:outer$.yaxis] autorelease]);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$size_, self, nil);
  JreOperatorRetainedAssign(&dy_, self, nil);
  JreOperatorRetainedAssign(&dx_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUiBgsScale9Background_$1 *typedCopy = (TripleplayUiBgsScale9Background_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.dx = dx_;
  typedCopy.dy = dy_;
  typedCopy.val$size = val$size_;
}

@end
