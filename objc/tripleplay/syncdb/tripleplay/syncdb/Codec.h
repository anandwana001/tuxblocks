//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/syncdb/Codec.java
//
//  Created by Thomas on 7/1/13.
//

@class IOSClass;
@class IOSIntArray;
@class JavaLangBoolean;
@class JavaLangEnum;
@class JavaLangInteger;
@class JavaLangLong;

#import "JreEmulation.h"

@interface TripleplaySyncdbCodec : NSObject {
}

+ (TripleplaySyncdbCodec *)STRING;
+ (TripleplaySyncdbCodec *)INT;
+ (TripleplaySyncdbCodec *)INTS;
+ (TripleplaySyncdbCodec *)LONG;
+ (TripleplaySyncdbCodec *)BOOLEAN;
- (NSString *)encodeWithId:(id)value;
- (id)decodeWithNSString:(NSString *)data;
- (id)decodeWithNSString:(NSString *)data
                  withId:(id)defval;
- (id)init;
@end

@interface TripleplaySyncdbCodec_EnumC : TripleplaySyncdbCodec {
 @public
  IOSClass *_eclass_;
}

@property (nonatomic, retain) IOSClass *_eclass;

+ (TripleplaySyncdbCodec_EnumC *)createWithIOSClass:(IOSClass *)eclass;
- (id)initWithIOSClass:(IOSClass *)eclass;
- (NSString *)encodeWithId:(JavaLangEnum *)value;
- (id)decodeWithNSString:(NSString *)data;
@end

@interface TripleplaySyncdbCodec_$1 : TripleplaySyncdbCodec {
}

- (NSString *)encodeWithId:(NSString *)value;
- (NSString *)decodeWithNSString:(NSString *)data;
- (id)init;
@end

@interface TripleplaySyncdbCodec_$2 : TripleplaySyncdbCodec {
}

- (NSString *)encodeWithId:(JavaLangInteger *)value;
- (JavaLangInteger *)decodeWithNSString:(NSString *)data;
- (id)init;
@end

@interface TripleplaySyncdbCodec_$3 : TripleplaySyncdbCodec {
}

- (NSString *)encodeWithId:(IOSIntArray *)values;
- (IOSIntArray *)decodeWithNSString:(NSString *)data;
- (id)init;
@end

@interface TripleplaySyncdbCodec_$4 : TripleplaySyncdbCodec {
}

- (NSString *)encodeWithId:(JavaLangLong *)value;
- (JavaLangLong *)decodeWithNSString:(NSString *)data;
- (id)init;
@end

@interface TripleplaySyncdbCodec_$5 : TripleplaySyncdbCodec {
}

- (NSString *)encodeWithId:(JavaLangBoolean *)value;
- (JavaLangBoolean *)decodeWithNSString:(NSString *)data;
- (id)init;
@end
