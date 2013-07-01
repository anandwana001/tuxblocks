//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/ui/ValueLabel.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "react/Connection.h"
#import "react/UnitSlot.h"
#import "react/ValueView.h"
#import "tripleplay/ui/Icon.h"
#import "tripleplay/ui/Label.h"
#import "tripleplay/ui/TextWidget.h"

@implementation TripleplayUiValueLabel

- (id<ReactValueView>)text_ {
  return text__;
}
- (void)setText_:(id<ReactValueView>)text_ {
  JreOperatorRetainedAssign(&text__, self, text_);
}
@synthesize text_ = text__;

- (id)initWithReactValueView:(id<ReactValueView>)text {
  if ((self = [super init])) {
    (void) [((id<ReactValueView>) NIL_CHK(text)) connectWithReactValueView_Listener:[self textDidChange]];
    self.text_ = text;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"VLabel(%@)", [((id<ReactValueView>) NIL_CHK(text__)) get]];
}

- (IOSClass *)getStyleClass {
  return [IOSClass classWithClass:[TripleplayUiLabel class]];
}

- (NSString *)text {
  return [NSString valueOf:[((id<ReactValueView>) NIL_CHK(text__)) get]];
}

- (id<TripleplayUiIcon>)icon {
  return nil;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&text__, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayUiValueLabel *typedCopy = (TripleplayUiValueLabel *) copy;
  typedCopy.text_ = text__;
}

@end
