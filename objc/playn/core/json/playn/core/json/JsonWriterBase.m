//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/json/JsonWriterBase.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "java/io/IOException.h"
#import "java/lang/Appendable.h"
#import "java/lang/Boolean.h"
#import "java/lang/Integer.h"
#import "java/util/Collection.h"
#import "java/util/Iterator.h"
#import "java/util/Map.h"
#import "java/util/Set.h"
#import "java/util/Stack.h"
#import "playn/core/Json.h"
#import "playn/core/json/JsonSink.h"
#import "playn/core/json/JsonStringWriter.h"
#import "playn/core/json/JsonTypes.h"
#import "playn/core/json/JsonWriterException.h"

@implementation PlaynCoreJsonJsonWriterBase

- (id<JavaLangAppendable>)appendable {
  return appendable_;
}
- (void)setAppendable:(id<JavaLangAppendable>)appendable {
  JreOperatorRetainedAssign(&appendable_, self, appendable);
}
@synthesize appendable = appendable_;
- (JavaUtilStack *)states {
  return states_;
}
- (void)setStates:(JavaUtilStack *)states {
  JreOperatorRetainedAssign(&states_, self, states);
}
@synthesize states = states_;
@synthesize first = first_;
@synthesize inObject = inObject_;
@synthesize verboseFormat = verboseFormat_;

- (id)initWithJavaLangAppendable:(id<JavaLangAppendable>)appendable {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&states_, self, [[[JavaUtilStack alloc] init] autorelease]);
    first_ = YES;
    self.appendable = appendable;
  }
  return self;
}

- (id)castThis {
  return (id<PlaynCoreJsonJsonSink>) self;
}

- (id)useVerboseFormatWithBOOL:(BOOL)verboseFormat {
  self.verboseFormat = verboseFormat;
  return [self castThis];
}

- (id)arrayWithJavaUtilCollection:(id<JavaUtilCollection>)c {
  return [self arrayWithNSString:nil withJavaUtilCollection:c];
}

- (id)arrayWithPlaynCoreJson_Array:(id<PlaynCoreJson_Array>)c {
  return [self arrayWithNSString:nil withPlaynCoreJson_Array:c];
}

- (id)arrayWithNSString:(NSString *)key
 withJavaUtilCollection:(id<JavaUtilCollection>)c {
  if (key == nil) (void) [self array];
  else (void) [self arrayWithNSString:key];
  {
    id<JavaUtilIterator> iter__ = [((id<JavaUtilCollection>) NIL_CHK(c)) iterator];
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      id o = [((id<JavaUtilIterator>) NIL_CHK(iter__)) next];
      (void) [self valueWithId:o];
    }
  }
  return [self end];
}

- (id)arrayWithNSString:(NSString *)key
withPlaynCoreJson_Array:(id<PlaynCoreJson_Array>)c {
  if (key == nil) (void) [self array];
  else (void) [self arrayWithNSString:key];
  (void) [((id<PlaynCoreJson_Array>) NIL_CHK(c)) writeWithPlaynCoreJsonJsonSink:self];
  return [self end];
}

- (id)objectWithJavaUtilMap:(id<JavaUtilMap>)map {
  return [self objectWithNSString:nil withJavaUtilMap:map];
}

- (id)objectWithPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)map {
  return [self objectWithNSString:nil withPlaynCoreJson_Object:map];
}

- (id)objectWithNSString:(NSString *)key
         withJavaUtilMap:(id<JavaUtilMap>)map {
  if (key == nil) (void) [self object];
  else (void) [self objectWithNSString:key];
  {
    id<JavaUtilIterator> iter__ = ((id<JavaUtilIterator>) [((id<JavaUtilSet>) [((id<JavaUtilMap>) NIL_CHK(map)) entrySet]) iterator]);
    while ([((id<JavaUtilIterator>) NIL_CHK(iter__)) hasNext]) {
      id<JavaUtilMap_Entry> entry = ((id<JavaUtilMap_Entry>) [((id<JavaUtilIterator>) NIL_CHK(iter__)) next]);
      id o = [((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getValue];
      if (!([[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] isKindOfClass:[NSString class]])) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:[NSString stringWithFormat:@"Invalid key type for map: %@", ([((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] == nil ? @"null" : [[((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey] getClass])]] autorelease];
      NSString *k = (NSString *) [((id<JavaUtilMap_Entry>) NIL_CHK(entry)) getKey];
      (void) [self valueWithNSString:k withId:o];
    }
  }
  return [self end];
}

- (id)objectWithNSString:(NSString *)key
withPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)obj {
  if (key == nil) (void) [self object];
  else (void) [self objectWithNSString:key];
  (void) [((id<PlaynCoreJson_Object>) NIL_CHK(obj)) writeWithPlaynCoreJsonJsonSink:self];
  return [self end];
}

- (id)nul {
  [self preValue];
  [self rawWithNSString:@"null"];
  return [self castThis];
}

- (id)nulWithNSString:(NSString *)key {
  [self preValueWithNSString:key];
  [self rawWithNSString:@"null"];
  return [self castThis];
}

- (id)valueWithId:(id)o {
  if (o == nil) return [self nul];
  else if ([o isKindOfClass:[NSString class]]) return [self valueWithNSString:(NSString *) o];
  else if ([o isKindOfClass:[NSNumber class]]) return [self valueWithNSNumber:((NSNumber *) o)];
  else if ([o isKindOfClass:[JavaLangBoolean class]]) return [self valueWithBOOL:[(JavaLangBoolean *) o booleanValue]];
  else if ([o conformsToProtocol: @protocol(JavaUtilCollection)]) return [self arrayWithJavaUtilCollection:(id<JavaUtilCollection>) o];
  else if ([o conformsToProtocol: @protocol(JavaUtilMap)]) return [self objectWithJavaUtilMap:(id<JavaUtilMap>) o];
  else if ([PlaynCoreJsonJsonTypes isArrayWithId:o]) return [self arrayWithPlaynCoreJson_Array:(id<PlaynCoreJson_Array>) o];
  else if ([PlaynCoreJsonJsonTypes isObjectWithId:o]) return [self objectWithPlaynCoreJson_Object:(id<PlaynCoreJson_Object>) o];
  else @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:[NSString stringWithFormat:@"Unable to handle type: %@", [o getClass]]] autorelease];
}

- (id)valueWithNSString:(NSString *)key
                 withId:(id)o {
  if (o == nil) return [self nulWithNSString:key];
  else if ([o isKindOfClass:[NSString class]]) return [self valueWithNSString:key withNSString:(NSString *) o];
  else if ([o isKindOfClass:[NSNumber class]]) return [self valueWithNSString:key withNSNumber:(NSNumber *) o];
  else if ([o isKindOfClass:[JavaLangBoolean class]]) return [self valueWithNSString:key withBOOL:[(JavaLangBoolean *) o booleanValue]];
  else if ([o conformsToProtocol: @protocol(JavaUtilCollection)]) return [self arrayWithNSString:key withJavaUtilCollection:(id<JavaUtilCollection>) o];
  else if ([o conformsToProtocol: @protocol(JavaUtilMap)]) return [self objectWithNSString:key withJavaUtilMap:(id<JavaUtilMap>) o];
  else if ([PlaynCoreJsonJsonTypes isArrayWithId:o]) return [self arrayWithNSString:key withPlaynCoreJson_Array:(id<PlaynCoreJson_Array>) o];
  else if ([PlaynCoreJsonJsonTypes isObjectWithId:o]) return [self objectWithNSString:key withPlaynCoreJson_Object:(id<PlaynCoreJson_Object>) o];
  else @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:[NSString stringWithFormat:@"Unable to handle type: %@", [o getClass]]] autorelease];
}

- (id)valueWithNSString:(NSString *)s {
  if (s == nil) return [self nul];
  [self preValue];
  [self emitStringValueWithNSString:s];
  return [self castThis];
}

- (id)valueWithBOOL:(BOOL)b {
  [self preValue];
  [self rawWithNSString:[JavaLangBoolean toStringWithBOOL:b]];
  return [self castThis];
}

- (id)valueWithNSNumber:(NSNumber *)n {
  [self preValue];
  if (n == nil) [self rawWithNSString:@"null"];
  else [self rawWithNSString:[n description]];
  return [self castThis];
}

- (id)valueWithNSString:(NSString *)key
           withNSString:(NSString *)s {
  if (s == nil) return [self nulWithNSString:key];
  [self preValueWithNSString:key];
  [self emitStringValueWithNSString:s];
  return [self castThis];
}

- (id)valueWithNSString:(NSString *)key
               withBOOL:(BOOL)b {
  [self preValueWithNSString:key];
  [self rawWithNSString:[JavaLangBoolean toStringWithBOOL:b]];
  return [self castThis];
}

- (id)valueWithNSString:(NSString *)key
           withNSNumber:(NSNumber *)n {
  if (n == nil) return [self nulWithNSString:key];
  [self preValueWithNSString:key];
  [self rawWithNSString:[((NSNumber *) NIL_CHK(n)) description]];
  return [self castThis];
}

- (id)array {
  [self preValue];
  (void) [((JavaUtilStack *) NIL_CHK(states_)) pushWithId:[JavaLangBoolean valueOfWithBOOL:inObject_]];
  inObject_ = NO;
  first_ = YES;
  [self rawWithUnichar:'['];
  if (verboseFormat_) [self rawWithUnichar:0x000a];
  return [self castThis];
}

- (id)object {
  [self preValue];
  (void) [((JavaUtilStack *) NIL_CHK(states_)) pushWithId:[JavaLangBoolean valueOfWithBOOL:inObject_]];
  inObject_ = YES;
  first_ = YES;
  [self rawWithUnichar:'{'];
  if (verboseFormat_) [self rawWithUnichar:0x000a];
  return [self castThis];
}

- (id)arrayWithNSString:(NSString *)key {
  [self preValueWithNSString:key];
  (void) [((JavaUtilStack *) NIL_CHK(states_)) pushWithId:[JavaLangBoolean valueOfWithBOOL:inObject_]];
  inObject_ = NO;
  first_ = YES;
  [self rawWithUnichar:'['];
  if (verboseFormat_) [self rawWithUnichar:0x000a];
  return [self castThis];
}

- (id)objectWithNSString:(NSString *)key {
  [self preValueWithNSString:key];
  (void) [((JavaUtilStack *) NIL_CHK(states_)) pushWithId:[JavaLangBoolean valueOfWithBOOL:inObject_]];
  inObject_ = YES;
  first_ = YES;
  [self rawWithUnichar:'{'];
  if (verboseFormat_) [self rawWithUnichar:0x000a];
  return [self castThis];
}

- (id)end {
  if ([((JavaUtilStack *) NIL_CHK(states_)) size] == 0) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Invalid call to end()"] autorelease];
  BOOL wasInObject = inObject_;
  first_ = NO;
  inObject_ = [((JavaLangBoolean *) [((JavaUtilStack *) NIL_CHK(states_)) pop]) booleanValue];
  if (verboseFormat_) {
    [self rawWithUnichar:0x000a];
    [self indent];
  }
  if (wasInObject) {
    [self rawWithUnichar:'}'];
  }
  else {
    [self rawWithUnichar:']'];
  }
  return [self castThis];
}

- (void)doneInternal {
  if ([((JavaUtilStack *) NIL_CHK(states_)) size] > 0) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Unclosed JSON objects and/or arrays when closing writer"] autorelease];
  if (first_) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Nothing was written to the JSON writer"] autorelease];
}

- (void)indent {
  for (int level = 0; level < [((JavaUtilStack *) NIL_CHK(states_)) size]; ++level) {
    [self rawWithNSString:@"  "];
  }
}

- (void)rawWithNSString:(NSString *)s {
  @try {
    (void) [((id<JavaLangAppendable>) NIL_CHK(appendable_)) appendWithJavaLangCharSequence:s];
  }
  @catch (JavaIoIOException *e) {
    @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithJavaLangThrowable:e] autorelease];
  }
}

- (void)rawWithUnichar:(unichar)c {
  @try {
    (void) [((id<JavaLangAppendable>) NIL_CHK(appendable_)) appendWithUnichar:c];
  }
  @catch (JavaIoIOException *e) {
    @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithJavaLangThrowable:e] autorelease];
  }
}

- (void)pre {
  if (first_) {
    first_ = NO;
  }
  else {
    if ([((JavaUtilStack *) NIL_CHK(states_)) size] == 0) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Invalid call to emit a value in a finished JSON writer"] autorelease];
    [self rawWithUnichar:','];
    if (verboseFormat_) [self rawWithUnichar:0x000a];
  }
  if (verboseFormat_) [self indent];
}

- (void)preValue {
  if (inObject_) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Invalid call to emit a keyless value while writing an object"] autorelease];
  [self pre];
}

- (void)preValueWithNSString:(NSString *)key {
  if (!inObject_) @throw [[[PlaynCoreJsonJsonWriterException alloc] initWithNSString:@"Invalid call to emit a key value while not writing an object"] autorelease];
  [self pre];
  [self emitStringValueWithNSString:key];
  [self rawWithUnichar:':'];
}

- (void)emitStringValueWithNSString:(NSString *)s {
  [self rawWithUnichar:'"'];
  unichar b = 0, c = 0;
  for (int i = 0; i < [NIL_CHK(s) length]; i++) {
    b = c;
    c = [NIL_CHK(s) charAtWithInt:i];
    switch (c) {
      case '\\':
      case '"':
      [self rawWithUnichar:'\\'];
      [self rawWithUnichar:c];
      break;
      case '/':
      if (b == '<') [self rawWithUnichar:'\\'];
      [self rawWithUnichar:c];
      break;
      case 0x0008:
      [self rawWithNSString:@"\\b"];
      break;
      case 0x0009:
      [self rawWithNSString:@"\\t"];
      break;
      case 0x000a:
      [self rawWithNSString:@"\\n"];
      break;
      case 0x000c:
      [self rawWithNSString:@"\\f"];
      break;
      case 0x000d:
      [self rawWithNSString:@"\\r"];
      break;
      default:
      if ([self shouldBeEscapedWithUnichar:c]) {
        NSString *t = [NSString stringWithFormat:@"000%@", [JavaLangInteger toHexStringWithInt:c]];
        [self rawWithNSString:[NSString stringWithFormat:@"\\u%@", [NIL_CHK(t) substring:[NIL_CHK(t) length] - [@"0000" length]]]];
      }
      else {
        [self rawWithUnichar:c];
      }
    }
  }
  [self rawWithUnichar:'"'];
}

- (BOOL)shouldBeEscapedWithUnichar:(unichar)c {
  return c < ' ' || (c >= 0x0080 && c < 0x00a0) || (c >= 0x2000 && c < 0x2100);
}

+ (NSString *)escapeWithNSString:(NSString *)s {
  NSString *json = [((id<PlaynCoreJson_Writer>) ((id<PlaynCoreJson_Writer>) [[[[PlaynCoreJsonJsonStringWriter alloc] init] autorelease] valueWithNSString:s])) write];
  return [NIL_CHK(json) substring:1 endIndex:[NIL_CHK(json) length] - 1];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&states_, self, nil);
  JreOperatorRetainedAssign(&appendable_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreJsonJsonWriterBase *typedCopy = (PlaynCoreJsonJsonWriterBase *) copy;
  typedCopy.appendable = appendable_;
  typedCopy.states = states_;
  typedCopy.first = first_;
  typedCopy.inObject = inObject_;
  typedCopy.verboseFormat = verboseFormat_;
}

@end
