//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/util/ElementOp.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Iterable.h"
#import "java/util/Iterator.h"
#import "tripleplay/ui/Element.h"

@implementation TripleplayUiUtilElementOp

+ (TripleplayUiUtilElementOp *)setEnabledWithBOOL:(BOOL)enabled {
  return [[[TripleplayUiUtilElementOp_$1 alloc] initWithBOOL:enabled] autorelease];
}

- (void)applyWithId:(TripleplayUiElement *)elem {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)applyToEachWithJavaLangIterable:(id<JavaLangIterable>)elems {
  {
    id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<JavaLangIterable>) NIL_CHK(elems)) iterator]);
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      TripleplayUiElement *elem = ((TripleplayUiElement *) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
      [self applyWithId:elem];
    }
  }
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation TripleplayUiUtilElementOp_$1

@synthesize val$enabled = val$enabled_;

- (void)applyWithId:(TripleplayUiElement *)elem {
  (void) [((TripleplayUiElement *) NIL_CHK(elem)) setEnabledWithBOOL:val$enabled_];
}

- (id)initWithBOOL:(BOOL)capture$0 {
  if ((self = [super init])) {
    val$enabled_ = capture$0;
  }
  return self;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUiUtilElementOp_$1 *typedCopy = (TripleplayUiUtilElementOp_$1 *) copy;
  typedCopy.val$enabled = val$enabled_;
}

@end
