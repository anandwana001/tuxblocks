//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/LogImpl.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "java/lang/Throwable.h"
#import "playn/core/Asserts.h"
#import "playn/core/Log.h"

@implementation PlaynCoreLogImpl

- (id<PlaynCoreLog_Collector>)collector {
  return collector_;
}
- (void)setCollector:(id<PlaynCoreLog_Collector>)collector {
  JreOperatorRetainedAssign(&collector_, self, collector);
}
@synthesize collector = collector_;
- (PlaynCoreLog_LevelEnum *)minLevel {
  return minLevel_;
}
- (void)setMinLevel:(PlaynCoreLog_LevelEnum *)minLevel {
  JreOperatorRetainedAssign(&minLevel_, self, minLevel);
}
@synthesize minLevel = minLevel_;

- (void)setCollectorWithPlaynCoreLog_Collector:(id<PlaynCoreLog_Collector>)collector {
  self.collector = collector;
}

- (void)setMinLevelWithPlaynCoreLog_LevelEnum:(PlaynCoreLog_LevelEnum *)level {
  JreOperatorRetainedAssign(&minLevel_, self, ((PlaynCoreLog_LevelEnum *) [PlaynCoreAsserts checkNotNullWithId:level]));
}

- (void)debugWithNSString:(NSString *)msg {
  [self debugWithNSString:msg withJavaLangThrowable:nil];
}

- (void)debugWithNSString:(NSString *)msg
    withJavaLangThrowable:(JavaLangThrowable *)e {
  [self logWithPlaynCoreLog_LevelEnum:[PlaynCoreLog_LevelEnum DEBUG_] withNSString:msg withJavaLangThrowable:e];
}

- (void)infoWithNSString:(NSString *)msg {
  [self infoWithNSString:msg withJavaLangThrowable:nil];
}

- (void)infoWithNSString:(NSString *)msg
   withJavaLangThrowable:(JavaLangThrowable *)e {
  [self logWithPlaynCoreLog_LevelEnum:[PlaynCoreLog_LevelEnum INFO] withNSString:msg withJavaLangThrowable:e];
}

- (void)warnWithNSString:(NSString *)msg {
  [self warnWithNSString:msg withJavaLangThrowable:nil];
}

- (void)warnWithNSString:(NSString *)msg
   withJavaLangThrowable:(JavaLangThrowable *)e {
  [self logWithPlaynCoreLog_LevelEnum:[PlaynCoreLog_LevelEnum WARN] withNSString:msg withJavaLangThrowable:e];
}

- (void)errorWithNSString:(NSString *)msg {
  [self errorWithNSString:msg withJavaLangThrowable:nil];
}

- (void)errorWithNSString:(NSString *)msg
    withJavaLangThrowable:(JavaLangThrowable *)e {
  [self logWithPlaynCoreLog_LevelEnum:[PlaynCoreLog_LevelEnum ERROR] withNSString:msg withJavaLangThrowable:e];
}

- (void)logWithPlaynCoreLog_LevelEnum:(PlaynCoreLog_LevelEnum *)level
                         withNSString:(NSString *)msg
                withJavaLangThrowable:(JavaLangThrowable *)e {
  if (collector_ != nil) [collector_ loggedWithPlaynCoreLog_LevelEnum:level withNSString:msg withJavaLangThrowable:e];
  if ([((PlaynCoreLog_LevelEnum *) NIL_CHK(level)) ordinal] >= [((PlaynCoreLog_LevelEnum *) NIL_CHK(minLevel_)) ordinal]) [self logImplWithPlaynCoreLog_LevelEnum:level withNSString:msg withJavaLangThrowable:e];
}

- (void)logImplWithPlaynCoreLog_LevelEnum:(PlaynCoreLog_LevelEnum *)level
                             withNSString:(NSString *)msg
                    withJavaLangThrowable:(JavaLangThrowable *)e {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (id)init {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&minLevel_, self, [PlaynCoreLog_LevelEnum DEBUG_]);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&minLevel_, self, nil);
  JreOperatorRetainedAssign(&collector_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PlaynCoreLogImpl *typedCopy = (PlaynCoreLogImpl *) copy;
  typedCopy.collector = collector_;
  typedCopy.minLevel = minLevel_;
}

@end
