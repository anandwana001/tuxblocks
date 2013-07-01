//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/syncdb/Protocol.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangStringBuilder;
@class JavaLangThrowable;
@class TripleplaySyncdbProtocol_Request;
@class TripleplaySyncdbProtocol_Response;
@class TripleplaySyncdbSyncDB;
@protocol JavaUtilMap;
@protocol PlaynCoreNet;
@protocol TripleplaySyncdbProtocol_Server;

#import "JreEmulation.h"
#import "java/lang/Runnable.h"
#import "playn/core/util/Callback.h"

@interface TripleplaySyncdbProtocol : NSObject {
}

+ (NSString *)VARABS;
+ (NSString *)VARCONT;
+ (int)BASE;
+ (unichar)ABS0;
+ (unichar)CONT0;
+ (NSString *)encodeRequestWithTripleplaySyncdbProtocol_Request:(TripleplaySyncdbProtocol_Request *)req;
+ (TripleplaySyncdbProtocol_Request *)decodeRequestWithNSString:(NSString *)payload;
+ (NSString *)encodeResponseWithTripleplaySyncdbProtocol_Response:(TripleplaySyncdbProtocol_Response *)rsp;
+ (TripleplaySyncdbProtocol_Response *)decodeResponseWithNSString:(NSString *)payload;
+ (int)protocolVersion;
- (id)init;
@end

@interface TripleplaySyncdbProtocol_Session : NSObject {
 @public
  id<TripleplaySyncdbProtocol_Server> _server_;
}

@property (nonatomic, retain) id<TripleplaySyncdbProtocol_Server> _server;

- (id)initWithTripleplaySyncdbProtocol_Server:(id<TripleplaySyncdbProtocol_Server>)server;
- (void)syncWithTripleplaySyncdbSyncDB:(TripleplaySyncdbSyncDB *)db;
- (void)onCleanSync;
- (void)onBeforeMergeWithInt:(int)version_
             withJavaUtilMap:(id<JavaUtilMap>)delta
        withJavaLangRunnable:(id<JavaLangRunnable>)apply;
- (void)onSyncFailureWithTripleplaySyncdbSyncDB:(TripleplaySyncdbSyncDB *)db
                          withJavaLangThrowable:(JavaLangThrowable *)cause;
- (void)onSyncSuccessWithTripleplaySyncdbSyncDB:(TripleplaySyncdbSyncDB *)db
                                withJavaUtilMap:(id<JavaUtilMap>)mods
          withTripleplaySyncdbProtocol_Response:(TripleplaySyncdbProtocol_Response *)rsp;
@end

@interface TripleplaySyncdbProtocol_Session_$1 : NSObject < PlaynCoreUtilCallback > {
 @public
  TripleplaySyncdbProtocol_Session *this$0_;
  TripleplaySyncdbSyncDB *val$db_;
  id<JavaUtilMap> val$mods_;
}

@property (nonatomic, retain) TripleplaySyncdbProtocol_Session *this$0;
@property (nonatomic, retain) TripleplaySyncdbSyncDB *val$db;
@property (nonatomic, retain) id<JavaUtilMap> val$mods;

- (void)onSuccessWithId:(TripleplaySyncdbProtocol_Response *)rsp;
- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)cause;
- (id)initWithTripleplaySyncdbProtocol_Session:(TripleplaySyncdbProtocol_Session *)outer$
                    withTripleplaySyncdbSyncDB:(TripleplaySyncdbSyncDB *)capture$0
                               withJavaUtilMap:(id<JavaUtilMap>)capture$1;
@end

@interface TripleplaySyncdbProtocol_Session_$2 : NSObject < JavaLangRunnable > {
 @public
  TripleplaySyncdbProtocol_Session *this$0_;
  TripleplaySyncdbSyncDB *val$db_;
  TripleplaySyncdbProtocol_Response *val$rsp_;
}

@property (nonatomic, retain) TripleplaySyncdbProtocol_Session *this$0;
@property (nonatomic, retain) TripleplaySyncdbSyncDB *val$db;
@property (nonatomic, retain) TripleplaySyncdbProtocol_Response *val$rsp;

- (void)run;
- (id)initWithTripleplaySyncdbProtocol_Session:(TripleplaySyncdbProtocol_Session *)outer$
                    withTripleplaySyncdbSyncDB:(TripleplaySyncdbSyncDB *)capture$0
         withTripleplaySyncdbProtocol_Response:(TripleplaySyncdbProtocol_Response *)capture$1;
@end

@interface TripleplaySyncdbProtocol_Request : NSObject {
 @public
  int protocolVersion_;
  int version__;
  id<JavaUtilMap> delta_;
}

@property (nonatomic, assign) int protocolVersion;
@property (nonatomic, assign) int version_;
@property (nonatomic, retain) id<JavaUtilMap> delta;

- (id)initWithInt:(int)version_
  withJavaUtilMap:(id<JavaUtilMap>)delta;
@end

@interface TripleplaySyncdbProtocol_Response : NSObject {
 @public
  int protocolVersion_;
  int version__;
  id<JavaUtilMap> delta_;
  BOOL cleanSync_;
}

@property (nonatomic, assign) int protocolVersion;
@property (nonatomic, assign) int version_;
@property (nonatomic, retain) id<JavaUtilMap> delta;
@property (nonatomic, assign) BOOL cleanSync;

- (id)initWithInt:(int)version_;
- (id)initWithInt:(int)version_
  withJavaUtilMap:(id<JavaUtilMap>)delta;
- (id)initWithInt:(int)version_
  withJavaUtilMap:(id<JavaUtilMap>)delta
         withBOOL:(BOOL)cleanSync;
@end

@protocol TripleplaySyncdbProtocol_Server < NSObject >
- (void)sendSyncWithInt:(int)version_
        withJavaUtilMap:(id<JavaUtilMap>)delta
withPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)onResponse;
@end

@interface TripleplaySyncdbProtocol_NetServer : NSObject < TripleplaySyncdbProtocol_Server > {
 @public
  id<PlaynCoreNet> _net_;
}

@property (nonatomic, retain) id<PlaynCoreNet> _net;

- (id)initWithPlaynCoreNet:(id<PlaynCoreNet>)net;
- (void)sendSyncWithInt:(int)version_
        withJavaUtilMap:(id<JavaUtilMap>)delta
withPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)cb;
- (NSString *)syncURLWithNSString:(NSString *)payload;
@end

@interface TripleplaySyncdbProtocol_NetServer_$1 : NSObject < PlaynCoreUtilCallback > {
 @public
  id<PlaynCoreUtilCallback> val$cb_;
}

@property (nonatomic, retain) id<PlaynCoreUtilCallback> val$cb;

- (void)onSuccessWithId:(NSString *)payload;
- (void)onFailureWithJavaLangThrowable:(JavaLangThrowable *)cause;
- (id)initWithPlaynCoreUtilCallback:(id<PlaynCoreUtilCallback>)capture$0;
@end

@interface TripleplaySyncdbProtocol_PayloadReader : NSObject {
 @public
  NSString *_payload_;
  int _pos_;
}

@property (nonatomic, copy) NSString *_payload;
@property (nonatomic, assign) int _pos;

- (id)initWithNSString:(NSString *)payload;
- (BOOL)atEOF;
- (int)readInt;
- (NSString *)readString;
@end

@interface TripleplaySyncdbProtocol_PayloadWriter : NSObject {
 @public
  JavaLangStringBuilder *_payload_;
}

@property (nonatomic, retain) JavaLangStringBuilder *_payload;

- (void)writeIntWithInt:(int)value;
- (void)writeStringWithNSString:(NSString *)value;
- (NSString *)payload;
- (void)writeIntWithInt:(int)value
               withBOOL:(BOOL)cont;
- (id)init;
@end
