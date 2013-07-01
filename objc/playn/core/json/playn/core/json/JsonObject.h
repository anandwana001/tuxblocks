//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/json/JsonObject.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@class JavaUtilHashMap;
@class PlaynCoreJsonJsonBuilder;
@protocol PlaynCoreJsonJsonSink;
@protocol PlaynCoreJson_Array;
@protocol PlaynCoreJson_TypedArray;

#import "JreEmulation.h"
#import "playn/core/Json.h"

@interface PlaynCoreJsonJsonObject : NSObject < PlaynCoreJson_Object > {
 @public
  JavaUtilHashMap *map_;
}

@property (nonatomic, retain) JavaUtilHashMap *map;

- (id)init;
+ (PlaynCoreJsonJsonBuilder *)builder;
- (id<PlaynCoreJson_Array>)getArrayWithNSString:(NSString *)key;
- (id<PlaynCoreJson_Array>)getArrayWithNSString:(NSString *)key
                        withPlaynCoreJson_Array:(id<PlaynCoreJson_Array>)default_;
- (BOOL)getBooleanWithNSString:(NSString *)key;
- (BOOL)getBooleanWithNSString:(NSString *)key
                      withBOOL:(BOOL)default_;
- (double)getDoubleWithNSString:(NSString *)key;
- (double)getDoubleWithNSString:(NSString *)key
                     withDouble:(double)default_;
- (float)getNumberWithNSString:(NSString *)key;
- (float)getNumberWithNSString:(NSString *)key
                     withFloat:(float)default_;
- (int)getIntWithNSString:(NSString *)key;
- (int)getIntWithNSString:(NSString *)key
                  withInt:(int)default_;
- (long long int)getLongWithNSString:(NSString *)key;
- (long long int)getLongWithNSString:(NSString *)key
                         withLongInt:(long long int)default_;
- (id<PlaynCoreJson_Object>)getObjectWithNSString:(NSString *)key;
- (id<PlaynCoreJson_Object>)getObjectWithNSString:(NSString *)key
                         withPlaynCoreJson_Object:(id<PlaynCoreJson_Object>)default_;
- (NSString *)getStringWithNSString:(NSString *)key;
- (NSString *)getStringWithNSString:(NSString *)key
                       withNSString:(NSString *)default_;
- (BOOL)containsKeyWithNSString:(NSString *)key;
- (BOOL)isArrayWithNSString:(NSString *)key;
- (BOOL)isBooleanWithNSString:(NSString *)key;
- (BOOL)isNullWithNSString:(NSString *)key;
- (BOOL)isNumberWithNSString:(NSString *)key;
- (BOOL)isStringWithNSString:(NSString *)key;
- (BOOL)isObjectWithNSString:(NSString *)key;
- (id<PlaynCoreJson_TypedArray>)getArrayWithNSString:(NSString *)key
                                        withIOSClass:(IOSClass *)valueType;
- (id<PlaynCoreJson_TypedArray>)getArrayWithNSString:(NSString *)key
                                        withIOSClass:(IOSClass *)valueType
                        withPlaynCoreJson_TypedArray:(id<PlaynCoreJson_TypedArray>)dflt;
- (id<PlaynCoreJson_TypedArray>)keys;
- (void)putWithNSString:(NSString *)key
                 withId:(id)value;
- (void)removeWithNSString:(NSString *)key;
- (NSString *)description;
- (id<PlaynCoreJsonJsonSink>)writeWithPlaynCoreJsonJsonSink:(id<PlaynCoreJsonJsonSink>)sink;
- (id)getWithNSString:(NSString *)key;
@end
