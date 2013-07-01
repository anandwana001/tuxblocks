//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/sound/SoundBoard.java
//
//  Created by Thomas on 7/1/13.
//

@class JavaLangBoolean;
@class JavaLangFloat;
@class TripleplaySoundSoundBoard_ClipImpl;
@class TripleplaySoundSoundBoard_LazySound;
@protocol JavaUtilList;
@protocol JavaUtilSet;
@protocol PlaynCoreSound;

#import "JreEmulation.h"
#import "Clip.h"
#import "Loop.h"
#import "Playable.h"
#import "Slot.h"
#import "Sound.h"
#import "Value.h"

#define TripleplaySoundSoundBoard_FADE_DURATION 1000.0

@interface TripleplaySoundSoundBoard : NSObject {
 @public
  ReactValue *volume_;
  ReactValue *muted_;
  id<JavaUtilSet> _active_;
  id<JavaUtilList> _faders_;
}

@property (nonatomic, retain) ReactValue *volume;
@property (nonatomic, retain) ReactValue *muted;
@property (nonatomic, retain) id<JavaUtilSet> _active;
@property (nonatomic, retain) id<JavaUtilList> _faders;

+ (float)FADE_DURATION;
- (id)init;
- (void)updateWithInt:(int)delta;
- (id<TripleplaySoundClip>)getClipWithNSString:(NSString *)path;
- (id<TripleplaySoundLoop>)getLoopWithNSString:(NSString *)path;
- (BOOL)shouldPlay;
@end

@interface TripleplaySoundSoundBoard_ClipImpl_$1 : PlaynCoreSound_Silence {
 @public
  TripleplaySoundSoundBoard_ClipImpl *this$0_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard_ClipImpl *this$0;

- (BOOL)play;
- (void)stop;
- (id)initWithTripleplaySoundSoundBoard_ClipImpl:(TripleplaySoundSoundBoard_ClipImpl *)outer$;
@end

@interface TripleplaySoundSoundBoard_Fader : NSObject {
}

- (BOOL)updateWithInt:(int)delta;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_LazySound_$1 : TripleplaySoundSoundBoard_Fader {
 @public
  TripleplaySoundSoundBoard_LazySound *this$1_;
  float _range_;
  int _elapsed_;
  float val$fadeMillis_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard_LazySound *this$1;
@property (nonatomic, assign) float _range;
@property (nonatomic, assign) int _elapsed;
@property (nonatomic, assign) float val$fadeMillis;

- (BOOL)updateWithInt:(int)delta;
- (id)initWithTripleplaySoundSoundBoard_LazySound:(TripleplaySoundSoundBoard_LazySound *)outer$
                                        withFloat:(float)capture$0;
@end

@interface TripleplaySoundSoundBoard_LazySound_$2 : TripleplaySoundSoundBoard_Fader {
 @public
  TripleplaySoundSoundBoard_LazySound *this$1_;
  float _start_;
  int _elapsed_;
  float val$fadeMillis_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard_LazySound *this$1;
@property (nonatomic, assign) float _start;
@property (nonatomic, assign) int _elapsed;
@property (nonatomic, assign) float val$fadeMillis;

- (BOOL)updateWithInt:(int)delta;
- (id)initWithTripleplaySoundSoundBoard_LazySound:(TripleplaySoundSoundBoard_LazySound *)outer$
                                        withFloat:(float)capture$0;
@end

@interface TripleplaySoundSoundBoard_$1 : ReactValue {
}

- (JavaLangFloat *)updateAndNotifyIfWithJavaLangFloat:(JavaLangFloat *)value;
- (id)initWithJavaLangFloat:(JavaLangFloat *)arg$0;
@end

@interface TripleplaySoundSoundBoard_$2 : ReactSlot {
 @public
  TripleplaySoundSoundBoard *this$0_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard *this$0;

- (void)onEmitWithId:(JavaLangFloat *)volume;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_$3 : ReactSlot {
 @public
  TripleplaySoundSoundBoard *this$0_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard *this$0;

- (void)onEmitWithId:(JavaLangBoolean *)muted;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_LazySound : NSObject < TripleplaySoundPlayable > {
 @public
  TripleplaySoundSoundBoard *this$0_;
  id<PlaynCoreSound> sound_;
  float _volume_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard *this$0;
@property (nonatomic, retain) id<PlaynCoreSound> sound;
@property (nonatomic, assign) float _volume;

- (BOOL)isPlaying;
- (void)setVolumeWithFloat:(float)volume;
- (float)volume;
- (void)release__;
- (NSUInteger)hash;
- (BOOL)isEqual:(id)other;
- (void)updateVolumeWithFloat:(float)volume;
- (void)startFadeInWithFloat:(float)fadeMillis;
- (void)startFadeOutWithFloat:(float)fadeMillis;
- (id<PlaynCoreSound>)prepareSound;
- (void)fadeOutComplete;
- (id<PlaynCoreSound>)loadSoundWithNSString:(NSString *)path;
- (NSString *)path;
- (void)play;
- (void)stop;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_ClipImpl : TripleplaySoundSoundBoard_LazySound < TripleplaySoundClip > {
 @public
  TripleplaySoundSoundBoard *this$1_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard *this$1;

- (void)preload;
- (void)play;
- (void)fadeInWithFloat:(float)fadeMillis;
- (void)fadeOutWithFloat:(float)fadeMillis;
- (void)stop;
- (id<PlaynCoreSound>)asSound;
- (NSString *)description;
- (id<PlaynCoreSound>)loadSoundWithNSString:(NSString *)path;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_$4 : TripleplaySoundSoundBoard_ClipImpl {
 @public
  NSString *val$path_;
}

@property (nonatomic, copy) NSString *val$path;

- (NSString *)path;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$
                           withNSString:(NSString *)capture$0;
@end

@interface TripleplaySoundSoundBoard_LoopImpl : TripleplaySoundSoundBoard_LazySound < TripleplaySoundLoop > {
 @public
  TripleplaySoundSoundBoard *this$1_;
}

@property (nonatomic, retain) TripleplaySoundSoundBoard *this$1;

- (void)fadeForMuteWithBOOL:(BOOL)muted;
- (void)play;
- (void)fadeInWithFloat:(float)fadeMillis;
- (void)fadeOutWithFloat:(float)fadeMillis;
- (void)stop;
- (NSString *)description;
- (id<PlaynCoreSound>)prepareSound;
- (void)fadeOutComplete;
- (id<PlaynCoreSound>)loadSoundWithNSString:(NSString *)path;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$;
@end

@interface TripleplaySoundSoundBoard_$5 : TripleplaySoundSoundBoard_LoopImpl {
 @public
  NSString *val$path_;
}

@property (nonatomic, copy) NSString *val$path;

- (NSString *)path;
- (id)initWithTripleplaySoundSoundBoard:(TripleplaySoundSoundBoard *)outer$
                           withNSString:(NSString *)capture$0;
@end