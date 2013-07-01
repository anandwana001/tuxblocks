//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: react/RMap.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangBoolean;
@class ReactRMap_Listener;
@class ReactValue;
@protocol JavaUtilCollection;
@protocol JavaUtilSet;
@protocol ReactConnection;
@protocol ReactValueView;

#import "JreEmulation.h"
#import "java/util/AbstractCollection.h"
#import "java/util/AbstractSet.h"
#import "java/util/Iterator.h"
#import "java/util/Map.h"
#import "react/MappedValue.h"
#import "react/Reactor.h"

@interface ReactRMap : ReactReactor < JavaUtilMap > {
 @public
  id<JavaUtilMap> _impl_;
  ReactValue *_sizeView_;
}

@property (nonatomic, retain) id<JavaUtilMap> _impl;
@property (nonatomic, retain) ReactValue *_sizeView;

+ (ReactRMap *)create;
+ (ReactRMap *)createWithJavaUtilMap:(id<JavaUtilMap>)impl;
- (id)initWithJavaUtilMap:(id<JavaUtilMap>)impl;
- (id<ReactConnection>)connectWithReactRMap_Listener:(ReactRMap_Listener *)listener;
- (void)disconnectWithReactRMap_Listener:(ReactRMap_Listener *)listener;
- (id)getOrElseWithId:(id)key
               withId:(id)defaultValue;
- (id)putForceWithId:(id)key
              withId:(id)value;
- (id)removeForceWithId:(id)key;
- (id<ReactValueView>)containsKeyViewWithId:(id)key;
- (id<ReactValueView>)getViewWithId:(id)key;
- (id<ReactValueView>)sizeView;
- (int)size;
- (BOOL)isEmpty;
- (BOOL)containsKeyWithId:(id)key;
- (BOOL)containsValueWithId:(id)value;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)other;
- (NSString *)description;
- (id)getWithId:(id)key;
- (id)putWithId:(id)key
         withId:(id)value;
- (id)removeWithId:(id)rawKey;
- (void)putAllWithJavaUtilMap:(id<JavaUtilMap>)map;
- (void)clear;
- (id<JavaUtilSet>)keySet;
- (id<JavaUtilCollection>)values;
- (id<JavaUtilSet>)entrySet;
- (void)emitPutWithId:(id)key
               withId:(id)value
               withId:(id)oldValue;
- (void)notifyPutWithId:(id)key
                 withId:(id)value
                 withId:(id)oldValue;
- (void)emitRemoveWithId:(id)key
                  withId:(id)oldValue;
- (void)notifyRemoveWithId:(id)key
                    withId:(id)oldValue;
@end

@interface ReactRMap_$1 : ReactMappedValue {
 @public
  ReactRMap *this$0_;
  id val$key_;
}

@property (nonatomic, retain) ReactRMap *this$0;
@property (nonatomic, retain) id val$key;

- (JavaLangBoolean *)get;
- (id<ReactConnection>)connect;
- (id)initWithReactRMap:(ReactRMap *)outer$
                 withId:(id)capture$0;
@end

@interface ReactRMap_Listener : ReactReactor_RListener {
}

- (void)onPutWithId:(id)key
             withId:(id)value
             withId:(id)oldValue;
- (void)onPutWithId:(id)key
             withId:(id)value;
- (void)onRemoveWithId:(id)key
                withId:(id)oldValue;
- (void)onRemoveWithId:(id)key;
- (id)init;
@end

@interface ReactRMap_$1_$1 : ReactRMap_Listener {
 @public
  ReactRMap_$1 *this$0_;
}

@property (nonatomic, retain) ReactRMap_$1 *this$0;

- (void)onPutWithId:(id)pkey
             withId:(id)value
             withId:(id)ovalue;
- (void)onRemoveWithId:(id)rkey
                withId:(id)ovalue;
- (id)initWithReactRMap_$1:(ReactRMap_$1 *)outer$;
@end

@interface ReactRMap_$2 : ReactMappedValue {
 @public
  ReactRMap *this$0_;
  id val$key_;
}

@property (nonatomic, retain) ReactRMap *this$0;
@property (nonatomic, retain) id val$key;

- (id)get;
- (id<ReactConnection>)connect;
- (id)initWithReactRMap:(ReactRMap *)outer$
                 withId:(id)capture$0;
@end

@interface ReactRMap_$2_$1 : ReactRMap_Listener {
 @public
  ReactRMap_$2 *this$0_;
}

@property (nonatomic, retain) ReactRMap_$2 *this$0;

- (void)onPutWithId:(id)pkey
             withId:(id)value
             withId:(id)ovalue;
- (void)onRemoveWithId:(id)pkey
                withId:(id)ovalue;
- (id)initWithReactRMap_$2:(ReactRMap_$2 *)outer$;
@end

@interface ReactRMap_$3 : ReactRMap_Listener {
 @public
  ReactRMap *this$0_;
}

@property (nonatomic, retain) ReactRMap *this$0;

- (void)onPutWithId:(id)key
             withId:(id)value
             withId:(id)ovalue;
- (void)onRemoveWithId:(id)key;
- (id)initWithReactRMap:(ReactRMap *)outer$;
@end

@interface ReactRMap_$4 : JavaUtilAbstractSet {
 @public
  ReactRMap *this$0_;
  id<JavaUtilSet> val$iset_;
}

@property (nonatomic, retain) ReactRMap *this$0;
@property (nonatomic, retain) id<JavaUtilSet> val$iset;

- (id<JavaUtilIterator>)iterator;
- (int)size;
- (BOOL)removeWithId:(id)o;
- (void)clear;
- (id)initWithReactRMap:(ReactRMap *)outer$
        withJavaUtilSet:(id<JavaUtilSet>)capture$0;
@end

@interface ReactRMap_$4_$1 : NSObject < JavaUtilIterator > {
 @public
  ReactRMap_$4 *this$0_;
  id _current_;
  id<JavaUtilIterator> val$iiter_;
}

@property (nonatomic, retain) ReactRMap_$4 *this$0;
@property (nonatomic, retain) id _current;
@property (nonatomic, retain) id<JavaUtilIterator> val$iiter;

- (BOOL)hasNext;
- (id)next;
- (void)remove;
- (id)initWithReactRMap_$4:(ReactRMap_$4 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0;
@end

@interface ReactRMap_$5 : JavaUtilAbstractCollection {
 @public
  ReactRMap *this$0_;
  id<JavaUtilCollection> val$iset_;
}

@property (nonatomic, retain) ReactRMap *this$0;
@property (nonatomic, retain) id<JavaUtilCollection> val$iset;

- (id<JavaUtilIterator>)iterator;
- (int)size;
- (BOOL)containsWithId:(id)o;
- (void)clear;
- (id)initWithReactRMap:(ReactRMap *)outer$
 withJavaUtilCollection:(id<JavaUtilCollection>)capture$0;
@end

@interface ReactRMap_$5_$1 : NSObject < JavaUtilIterator > {
 @public
  ReactRMap_$5 *this$0_;
  id<JavaUtilMap_Entry> _current_;
  id<JavaUtilIterator> val$iiter_;
}

@property (nonatomic, retain) ReactRMap_$5 *this$0;
@property (nonatomic, retain) id<JavaUtilMap_Entry> _current;
@property (nonatomic, retain) id<JavaUtilIterator> val$iiter;

- (BOOL)hasNext;
- (id)next;
- (void)remove;
- (id)initWithReactRMap_$5:(ReactRMap_$5 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0;
@end

@interface ReactRMap_$6 : JavaUtilAbstractSet {
 @public
  ReactRMap *this$0_;
  id<JavaUtilSet> val$iset_;
}

@property (nonatomic, retain) ReactRMap *this$0;
@property (nonatomic, retain) id<JavaUtilSet> val$iset;

- (id<JavaUtilIterator>)iterator;
- (BOOL)containsWithId:(id)o;
- (BOOL)removeWithId:(id)o;
- (int)size;
- (void)clear;
- (id)initWithReactRMap:(ReactRMap *)outer$
        withJavaUtilSet:(id<JavaUtilSet>)capture$0;
@end

@interface ReactRMap_$6_$1 : NSObject < JavaUtilIterator > {
 @public
  ReactRMap_$6 *this$0_;
  id<JavaUtilMap_Entry> _current_;
  id<JavaUtilIterator> val$iiter_;
}

@property (nonatomic, retain) ReactRMap_$6 *this$0;
@property (nonatomic, retain) id<JavaUtilMap_Entry> _current;
@property (nonatomic, retain) id<JavaUtilIterator> val$iiter;

- (BOOL)hasNext;
- (id<JavaUtilMap_Entry>)next;
- (void)remove;
- (id)initWithReactRMap_$6:(ReactRMap_$6 *)outer$
      withJavaUtilIterator:(id<JavaUtilIterator>)capture$0;
@end

@interface ReactRMap_$6_$1_$1 : NSObject < JavaUtilMap_Entry > {
 @public
  ReactRMap_$6_$1 *this$0_;
  id<JavaUtilMap_Entry> _ientry_;
}

@property (nonatomic, retain) ReactRMap_$6_$1 *this$0;
@property (nonatomic, retain) id<JavaUtilMap_Entry> _ientry;

- (id)getKey;
- (id)getValue;
- (id)setValueWithId:(id)value;
- (BOOL)isEqual:(id)o;
- (NSUInteger)hash;
- (id)initWithReactRMap_$6_$1:(ReactRMap_$6_$1 *)outer$;
@end
