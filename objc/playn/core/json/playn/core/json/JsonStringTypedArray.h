//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/json/JsonStringTypedArray.java
//
//  Created by Thomas on 7/1/13.
//

@protocol JavaUtilCollection;

#import "JreEmulation.h"
#import "java/util/ArrayList.h"
#import "playn/core/Json.h"

#define PlaynCoreJsonJsonStringTypedArray_serialVersionUID 1

@interface PlaynCoreJsonJsonStringTypedArray : JavaUtilArrayList < PlaynCoreJson_TypedArray > {
}

- (id)initWithJavaUtilCollection:(id<JavaUtilCollection>)contents;
- (int)length;
- (NSString *)getWithInt:(int)index
                  withId:(NSString *)dflt;
@end
