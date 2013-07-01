//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/flump/LayerData.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/util/ArrayList.h"
#import "java/util/Collections.h"
#import "java/util/Iterator.h"
#import "java/util/List.h"
#import "playn/core/Json.h"
#import "tripleplay/flump/KeyframeData.h"
#import "tripleplay/flump/Symbol.h"

@implementation TripleplayFlumpLayerData

- (NSString *)name {
  return name_;
}
- (void)setName:(NSString *)name {
  JreOperatorRetainedAssign(&name_, self, name);
}
@synthesize name = name_;
- (id<JavaUtilList>)keyframes {
  return keyframes_;
}
- (void)setKeyframes:(id<JavaUtilList>)keyframes {
  JreOperatorRetainedAssign(&keyframes_, self, keyframes);
}
@synthesize keyframes = keyframes_;
@synthesize _multipleSymbols = _multipleSymbols_;
- (id<TripleplayFlumpSymbol>)_lastSymbol {
  return _lastSymbol_;
}
- (void)set_lastSymbol:(id<TripleplayFlumpSymbol>)_lastSymbol {
  JreOperatorRetainedAssign(&_lastSymbol_, self, _lastSymbol);
}
@synthesize _lastSymbol = _lastSymbol_;

- (id)initWithPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)json {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&name_, self, [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getStringWithNSString:@"name"]);
    JavaUtilArrayList *keyframes = [[[JavaUtilArrayList alloc] init] autorelease];
    self.keyframes = ((id<JavaUtilList>) [JavaUtilCollections unmodifiableListWithJavaUtilList:keyframes]);
    TripleplayFlumpKeyframeData *prevKf = nil;
    {
      id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<PlaynCoreJson_TypedArray>) [((id<PlaynCoreJson_Object>) NIL_CHK(json)) getArrayWithNSString:@"keyframes" withIOSClass:[IOSClass classWithProtocol:@protocol(PlaynCoreJson_Object)]]) iterator]);
      while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
        id<PlaynCoreJson_Object> kfJson = ((id<PlaynCoreJson_Object>) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
        prevKf = [[[TripleplayFlumpKeyframeData alloc] initWithPlaynCoreJson_Object:kfJson withTripleplayFlumpKeyframeData:prevKf] autorelease];
        [((JavaUtilArrayList *) NIL_CHK(keyframes)) addWithId:prevKf];
      }
    }
  }
  return self;
}

- (int)frames {
  TripleplayFlumpKeyframeData *lastKf = ((TripleplayFlumpKeyframeData *) [((id<JavaUtilList>) NIL_CHK(keyframes_)) getWithInt:[((id<JavaUtilList>) NIL_CHK(keyframes_)) size] - 1]);
  return ((TripleplayFlumpKeyframeData *) NIL_CHK(lastKf)).index + ((TripleplayFlumpKeyframeData *) NIL_CHK(lastKf)).duration;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_lastSymbol_, self, nil);
  JreOperatorRetainedAssign(&keyframes_, self, nil);
  JreOperatorRetainedAssign(&name_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayFlumpLayerData *typedCopy = (TripleplayFlumpLayerData *) copy;
  typedCopy.name = name_;
  typedCopy.keyframes = keyframes_;
  typedCopy._multipleSymbols = _multipleSymbols_;
  typedCopy._lastSymbol = _lastSymbol_;
}

@end
