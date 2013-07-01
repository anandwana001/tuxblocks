//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/flump/MoviePlayer.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSClass.h"
#import "java/lang/IllegalStateException.h"
#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/Layer.h"
#import "playn/core/PlayN.h"
#import "playn/core/util/Clock.h"
#import "react/Value.h"
#import "tripleplay/anim/Animation.h"
#import "tripleplay/flump/Library.h"
#import "tripleplay/flump/Movie.h"

@implementation TripleplayFlumpMoviePlayer

- (ReactValue *)movie_ {
  return movie__;
}
- (void)setMovie_:(ReactValue *)movie_ {
  JreOperatorRetainedAssign(&movie__, self, movie_);
}
@synthesize movie_ = movie__;
- (TripleplayFlumpLibrary *)_lib {
  return _lib_;
}
- (void)set_lib:(TripleplayFlumpLibrary *)_lib {
  JreOperatorRetainedAssign(&_lib_, self, _lib);
}
@synthesize _lib = _lib_;
- (id<PlaynCoreGroupLayer>)_root {
  return _root_;
}
- (void)set_root:(id<PlaynCoreGroupLayer>)_root {
  JreOperatorRetainedAssign(&_root_, self, _root);
}
@synthesize _root = _root_;
- (TripleplayFlumpMovie *)_oneshotMovie {
  return _oneshotMovie_;
}
- (void)set_oneshotMovie:(TripleplayFlumpMovie *)_oneshotMovie {
  JreOperatorRetainedAssign(&_oneshotMovie_, self, _oneshotMovie);
}
@synthesize _oneshotMovie = _oneshotMovie_;
- (TripleplayFlumpMovie *)_loopingMovie {
  return _loopingMovie_;
}
- (void)set_loopingMovie:(TripleplayFlumpMovie *)_loopingMovie {
  JreOperatorRetainedAssign(&_loopingMovie_, self, _loopingMovie);
}
@synthesize _loopingMovie = _loopingMovie_;

- (TripleplayFlumpMovie *)movie {
  return ((TripleplayFlumpMovie *) [((ReactValue *) NIL_CHK(movie__)) get]);
}

- (id)initWithTripleplayFlumpLibrary:(TripleplayFlumpLibrary *)lib {
  return [self initTripleplayFlumpMoviePlayerWithTripleplayFlumpLibrary:lib withPlaynCoreGroupLayer:[((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createGroupLayer]];
}

- (id)initTripleplayFlumpMoviePlayerWithTripleplayFlumpLibrary:(TripleplayFlumpLibrary *)lib
                                       withPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)root {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&movie__, self, ((ReactValue *) [ReactValue createWithId:nil]));
    JreOperatorRetainedAssign(&_lib_, self, lib);
    JreOperatorRetainedAssign(&_root_, self, root);
  }
  return self;
}

- (id)initWithTripleplayFlumpLibrary:(TripleplayFlumpLibrary *)lib
             withPlaynCoreGroupLayer:(id<PlaynCoreGroupLayer>)root {
  return [self initTripleplayFlumpMoviePlayerWithTripleplayFlumpLibrary:lib withPlaynCoreGroupLayer:root];
}

- (id<PlaynCoreLayer>)layer {
  return _root_;
}

- (BOOL)looping {
  return _oneshotMovie_ == nil && _loopingMovie_ != nil;
}

- (TripleplayFlumpMoviePlayer *)playWithNSString:(NSString *)name
                                        withBOOL:(BOOL)restart {
  if (_loopingMovie_ == nil) {
    @throw [[[JavaLangIllegalStateException alloc] initWithNSString:@"A loop must be started before the first call to play()"] autorelease];
  }
  if (restart || _oneshotMovie_ == nil || ![[[((TripleplayFlumpMovie *) NIL_CHK(_oneshotMovie_)) symbol] name] isEqual:name]) {
    JreOperatorRetainedAssign(&_oneshotMovie_, self, [self setCurrentWithTripleplayFlumpMovie:[self createMovieWithNSString:name]]);
  }
  return self;
}

- (TripleplayFlumpMoviePlayer *)playWithNSString:(NSString *)name {
  return [self playWithNSString:name withBOOL:YES];
}

- (TripleplayFlumpMoviePlayer *)loopWithNSString:(NSString *)name
                                        withBOOL:(BOOL)restart {
  if (restart || _loopingMovie_ == nil || ![[[((TripleplayFlumpMovie *) NIL_CHK(_loopingMovie_)) symbol] name] isEqual:name]) {
    JreOperatorRetainedAssign(&_oneshotMovie_, self, nil);
    JreOperatorRetainedAssign(&_loopingMovie_, self, [self setCurrentWithTripleplayFlumpMovie:[self createMovieWithNSString:name]]);
  }
  return self;
}

- (TripleplayFlumpMoviePlayer *)loopWithNSString:(NSString *)name {
  return [self loopWithNSString:name withBOOL:YES];
}

- (TripleplayAnimAnimation *)animateWithNSString:(NSString *)name {
  return [[[TripleplayFlumpMoviePlayer_PlayAnimation alloc] initWithTripleplayFlumpMoviePlayer:self withNSString:name] autorelease];
}

- (void)paintWithPlaynCoreUtilClock:(id<PlaynCoreUtilClock>)clock {
  if (_oneshotMovie_ != nil && [((TripleplayFlumpMovie *) NIL_CHK(_oneshotMovie_)) position] + [((id<PlaynCoreUtilClock>) NIL_CHK(clock)) dt] * [((TripleplayFlumpMovie *) NIL_CHK(_oneshotMovie_)) speed] > [((TripleplayFlumpMovie *) NIL_CHK(_oneshotMovie_)) symbol].duration) {
    JreOperatorRetainedAssign(&_oneshotMovie_, self, nil);
    (void) [self setCurrentWithTripleplayFlumpMovie:_loopingMovie_];
  }
  [[self movie] paintWithPlaynCoreUtilClock:clock];
}

- (TripleplayFlumpMovie *)createMovieWithNSString:(NSString *)name {
  return [((TripleplayFlumpLibrary *) NIL_CHK(_lib_)) createMovieWithNSString:name];
}

- (TripleplayFlumpMovie *)setCurrentWithTripleplayFlumpMovie:(TripleplayFlumpMovie *)current {
  if ([self movie] != nil) {
    [((id<PlaynCoreGroupLayer>) NIL_CHK(_root_)) removeWithPlaynCoreLayer:[[self movie] layer]];
  }
  [((id<PlaynCoreGroupLayer>) NIL_CHK(_root_)) addWithPlaynCoreLayer:[((TripleplayFlumpMovie *) NIL_CHK(current)) layer]];
  (void) [((ReactValue *) NIL_CHK(movie__)) updateWithId:current];
  return current;
}

- (void)destroy {
  if ([self movie] != nil) {
    [((id<PlaynCoreGroupLayer>) [[self movie] layer]) destroy];
  }
  JreOperatorRetainedAssign(&_loopingMovie_, self, nil);
  JreOperatorRetainedAssign(&_oneshotMovie_, self, nil);
  (void) [((ReactValue *) NIL_CHK(movie__)) updateWithId:nil];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_loopingMovie_, self, nil);
  JreOperatorRetainedAssign(&_oneshotMovie_, self, nil);
  JreOperatorRetainedAssign(&_root_, self, nil);
  JreOperatorRetainedAssign(&_lib_, self, nil);
  JreOperatorRetainedAssign(&movie__, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayFlumpMoviePlayer *typedCopy = (TripleplayFlumpMoviePlayer *) copy;
  typedCopy.movie_ = movie__;
  typedCopy._lib = _lib_;
  typedCopy._root = _root_;
  typedCopy._oneshotMovie = _oneshotMovie_;
  typedCopy._loopingMovie = _loopingMovie_;
}

@end
@implementation TripleplayFlumpMoviePlayer_PlayAnimation

- (TripleplayFlumpMoviePlayer *)this$0 {
  return this$0_;
}
- (void)setThis$0:(TripleplayFlumpMoviePlayer *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (NSString *)_name {
  return _name_;
}
- (void)set_name:(NSString *)_name {
  JreOperatorRetainedAssign(&_name_, self, _name);
}
@synthesize _name = _name_;
- (TripleplayFlumpMovie *)_playing {
  return _playing_;
}
- (void)set_playing:(TripleplayFlumpMovie *)_playing {
  JreOperatorRetainedAssign(&_playing_, self, _playing);
}
@synthesize _playing = _playing_;

- (id)initWithTripleplayFlumpMoviePlayer:(TripleplayFlumpMoviePlayer *)outer$
                            withNSString:(NSString *)name {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&_name_, self, name);
  }
  return self;
}

- (void)init__WithFloat:(float)time OBJC_METHOD_FAMILY_NONE {
  [super init__WithFloat:time];
  (void) [this$0_ playWithNSString:_name_];
  JreOperatorRetainedAssign(&_playing_, self, [this$0_ movie]);
}

- (float)applyWithFloat:(float)time {
  return ([this$0_ movie] == _playing_) ? 1 : 0;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&_playing_, self, nil);
  JreOperatorRetainedAssign(&_name_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TripleplayFlumpMoviePlayer_PlayAnimation *typedCopy = (TripleplayFlumpMoviePlayer_PlayAnimation *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy._name = _name_;
  typedCopy._playing = _playing_;
}

@end
