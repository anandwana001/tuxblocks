//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/flump/KeyframeData.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Float.h"
#import "playn/core/Json.h"
#import "pythagoras/f/IPoint.h"
#import "pythagoras/f/Point.h"
#import "tripleplay/flump/Symbol.h"

@implementation TripleplayFlumpKeyframeData

@synthesize index = index_;
@synthesize duration = duration_;
- (NSString *)label {
  return label_;
}
- (void)setLabel:(NSString *)label {
  JreOperatorRetainedAssign(&label_, self, label);
}
@synthesize label = label_;
- (id<PythagorasFIPoint>)loc {
  return loc_;
}
- (void)setLoc:(id<PythagorasFIPoint>)loc {
  JreOperatorRetainedAssign(&loc_, self, loc);
}
@synthesize loc = loc_;
- (id<PythagorasFIPoint>)scale_ {
  return scale__;
}
- (void)setScale_:(id<PythagorasFIPoint>)scale_ {
  JreOperatorRetainedAssign(&scale__, self, scale_);
}
@synthesize scale_ = scale__;
- (id<PythagorasFIPoint>)skew {
  return skew_;
}
- (void)setSkew:(id<PythagorasFIPoint>)skew {
  JreOperatorRetainedAssign(&skew_, self, skew);
}
@synthesize skew = skew_;
- (id<PythagorasFIPoint>)pivot {
  return pivot_;
}
- (void)setPivot:(id<PythagorasFIPoint>)pivot {
  JreOperatorRetainedAssign(&pivot_, self, pivot);
}
@synthesize pivot = pivot_;
@synthesize visible = visible_;
@synthesize alpha = alpha_;
@synthesize tweened = tweened_;
@synthesize ease = ease_;
- (id<TripleplayFlumpSymbol>)_symbol {
  return _symbol_;
}
- (void)set_symbol:(id<TripleplayFlumpSymbol>)_symbol {
  JreOperatorRetainedAssign(&_symbol_, self, _symbol);
}
@synthesize _symbol = _symbol_;
- (NSString *)_symbolName {
  return _symbolName_;
}
- (void)set_symbolName:(NSString *)_symbolName {
  JreOperatorRetainedAssign(&_symbolName_, self, _symbolName);
}
@synthesize _symbolName = _symbolName_;

- (id)initWithPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)json
   withTripleplayFlumpKeyframeData:(TripleplayFlumpKeyframeData *)prevKf {
  if ((self = [super init])) {
    index_ = (prevKf != nil) ? ((TripleplayFlumpKeyframeData *) NIL_CHK(prevKf)).index + ((TripleplayFlumpKeyframeData *) NIL_CHK(prevKf)).duration : 0;
    duration_ = [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getIntWithNSString:@"duration"];
    JreOperatorRetainedAssign(&label_, self, [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getStringWithNSString:@"label"]);
    JreOperatorRetainedAssign(&loc_, self, [TripleplayFlumpKeyframeData getPointWithPlaynCoreJson_Object:json withNSString:@"loc" withFloat:0 withFloat:0]);
    JreOperatorRetainedAssign(&scale__, self, [TripleplayFlumpKeyframeData getPointWithPlaynCoreJson_Object:json withNSString:@"scale" withFloat:1 withFloat:1]);
    JreOperatorRetainedAssign(&skew_, self, [TripleplayFlumpKeyframeData getPointWithPlaynCoreJson_Object:json withNSString:@"skew" withFloat:0 withFloat:0]);
    JreOperatorRetainedAssign(&pivot_, self, [TripleplayFlumpKeyframeData getPointWithPlaynCoreJson_Object:json withNSString:@"pivot" withFloat:0 withFloat:0]);
    alpha_ = [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getNumberWithNSString:@"alpha" withFloat:1];
    visible_ = [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getBooleanWithNSString:@"visible" withBOOL:YES];
    tweened_ = [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getBooleanWithNSString:@"tweened" withBOOL:YES];
    ease_ = [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getNumberWithNSString:@"ease" withFloat:0];
    JreOperatorRetainedAssign(&_symbolName_, self, [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getStringWithNSString:@"ref"]);
  }
  return self;
}

- (id<TripleplayFlumpSymbol>)symbol {
  return _symbol_;
}

+ (id<PythagorasFIPoint>)getPointWithPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)json
                                             withNSString:(NSString *)field
                                                withFloat:(float)defX
                                                withFloat:(float)defY {
  id<PlaynCoreJson_TypedArray> array = ((id<PlaynCoreJson_TypedArray>) [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getArrayWithNSString:field withIOSClass:[IOSClass classWithClass:[JavaLangFloat class]]]);
  return (array != nil) ? [[[PythagorasFPoint alloc] initWithFloat:[((JavaLangFloat *) [((id<PlaynCoreJson_TypedArray>) NIL_CHK(array)) getWithInt:0]) floatValue] withFloat:[((JavaLangFloat *) [((id<PlaynCoreJson_TypedArray>) NIL_CHK(array)) getWithInt:1]) floatValue]] autorelease] : [[[PythagorasFPoint alloc] initWithFloat:defX withFloat:defY] autorelease];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_symbolName_, self, nil);
  JreOperatorRetainedAssign(&_symbol_, self, nil);
  JreOperatorRetainedAssign(&pivot_, self, nil);
  JreOperatorRetainedAssign(&skew_, self, nil);
  JreOperatorRetainedAssign(&scale__, self, nil);
  JreOperatorRetainedAssign(&loc_, self, nil);
  JreOperatorRetainedAssign(&label_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayFlumpKeyframeData *typedCopy = (TripleplayFlumpKeyframeData *) copy;
  typedCopy.index = index_;
  typedCopy.duration = duration_;
  typedCopy.label = label_;
  typedCopy.loc = loc_;
  typedCopy.scale_ = scale__;
  typedCopy.skew = skew_;
  typedCopy.pivot = pivot_;
  typedCopy.visible = visible_;
  typedCopy.alpha = alpha_;
  typedCopy.tweened = tweened_;
  typedCopy.ease = ease_;
  typedCopy._symbol = _symbol_;
  typedCopy._symbolName = _symbolName_;
}

@end
