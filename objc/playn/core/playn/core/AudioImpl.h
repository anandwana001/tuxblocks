//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: playn/core/AudioImpl.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangThrowable;
@class PlaynCoreAbstractSound;
@protocol PlaynCorePlatform;

#import "JreEmulation.h"
#import "java/lang/Runnable.h"
#import "playn/core/Audio.h"

@interface PlaynCoreAudioImpl : NSObject < PlaynCoreAudio > {
 @public
  id<PlaynCorePlatform> platform_;
}

@property (nonatomic, retain) id<PlaynCorePlatform> platform;

- (id)initWithPlaynCorePlatform:(id<PlaynCorePlatform>)platform;
- (void)dispatchLoadedWithPlaynCoreAbstractSound:(PlaynCoreAbstractSound *)sound
                                          withId:(id)impl;
- (void)dispatchLoadErrorWithPlaynCoreAbstractSound:(PlaynCoreAbstractSound *)sound
                              withJavaLangThrowable:(JavaLangThrowable *)error;
@end

@interface PlaynCoreAudioImpl_$1 : NSObject < JavaLangRunnable > {
 @public
  PlaynCoreAbstractSound *val$sound_;
  id val$impl_;
}

@property (nonatomic, retain) PlaynCoreAbstractSound *val$sound;
@property (nonatomic, retain) id val$impl;

- (void)run;
- (id)initWithPlaynCoreAbstractSound:(PlaynCoreAbstractSound *)capture$0
                              withId:(id)capture$1;
@end

@interface PlaynCoreAudioImpl_$2 : NSObject < JavaLangRunnable > {
 @public
  PlaynCoreAbstractSound *val$sound_;
  JavaLangThrowable *val$error_;
}

@property (nonatomic, retain) PlaynCoreAbstractSound *val$sound;
@property (nonatomic, retain) JavaLangThrowable *val$error;

- (void)run;
- (id)initWithPlaynCoreAbstractSound:(PlaynCoreAbstractSound *)capture$0
               withJavaLangThrowable:(JavaLangThrowable *)capture$1;
@end
