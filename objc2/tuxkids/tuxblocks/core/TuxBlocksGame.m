//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/TuxBlocksGame.java
//
//  Created by Thomas on 7/10/13.
//

#import "java/lang/Math.h"
#import "playn/core/Canvas.h"
#import "playn/core/CanvasImage.h"
#import "playn/core/Color.h"
#import "playn/core/Game.h"
#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/ImageLayer.h"
#import "playn/core/Layer.h"
#import "playn/core/PlayN.h"
#import "tripleplay/game/ScreenStack.h"
#import "tripleplay/game/trans/SlideTransition.h"
#import "tuxkids/tuxblocks/core/GameBackgroundSprite.h"
#import "tuxkids/tuxblocks/core/GameState.h"
#import "tuxkids/tuxblocks/core/SolidClock.h"
#import "tuxkids/tuxblocks/core/TuxBlocksGame.h"
#import "tuxkids/tuxblocks/core/defense/DefenseScreen.h"

@implementation TuxkidsTuxblocksCoreTuxBlocksGame

static TuxkidsTuxblocksCoreTuxBlocksGame * TuxkidsTuxblocksCoreTuxBlocksGame_instance_;

@synthesize clock = clock_;
@synthesize screens = screens_;
@synthesize background = background_;
@synthesize frames = frames_;
@synthesize lastUpdate = lastUpdate_;
@synthesize fpsLayer = fpsLayer_;

+ (int)UPDATE_RATE {
  return TuxkidsTuxblocksCoreTuxBlocksGame_UPDATE_RATE;
}

+ (TuxkidsTuxblocksCoreTuxBlocksGame *)instance {
  return TuxkidsTuxblocksCoreTuxBlocksGame_instance_;
}

+ (void)setInstance:(TuxkidsTuxblocksCoreTuxBlocksGame *)instance {
  TuxkidsTuxblocksCoreTuxBlocksGame_instance_ = instance;
}

+ (int)screenDepth {
  return [((TripleplayGameScreenStack *) NIL_CHK(TuxkidsTuxblocksCoreTuxBlocksGame_instance_.screens)) size];
}

- (id)init {
  if ((self = [super initWithInt:TuxkidsTuxblocksCoreTuxBlocksGame_UPDATE_RATE])) {
    clock_ = [[TuxkidsTuxblocksCoreSolidClock alloc] initWithInt:TuxkidsTuxblocksCoreTuxBlocksGame_UPDATE_RATE];
    screens_ = [[TuxkidsTuxblocksCoreTuxBlocksGame_$1 alloc] init];
    TuxkidsTuxblocksCoreTuxBlocksGame_instance_ = self;
  }
  return self;
}

- (void)init__ OBJC_METHOD_FAMILY_NONE {
  TuxkidsTuxblocksCoreGameState *state = [[TuxkidsTuxblocksCoreGameState alloc] init];
  background_ = [((TuxkidsTuxblocksCoreGameState *) NIL_CHK(state)) background];
  (void) [((id<PlaynCoreGroupLayer>) [((TuxkidsTuxblocksCoreGameBackgroundSprite *) NIL_CHK(background_)) layer]) setDepthWithFloat:-10];
  [((id<PlaynCoreGroupLayer>) [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) rootLayer]) addWithPlaynCoreLayer:[((TuxkidsTuxblocksCoreGameBackgroundSprite *) NIL_CHK(background_)) layer]];
  [((TripleplayGameScreenStack *) NIL_CHK(screens_)) pushWithTripleplayGameScreen:[[TuxkidsTuxblocksCoreDefenseDefenseScreen alloc] initWithTripleplayGameScreenStack:screens_ withTuxkidsTuxblocksCoreGameState:state]];
}

- (void)updateFPS {
  frames_++;
  if (lastUpdate_ < [PlaynCorePlayN currentTime] - 1000) {
    lastUpdate_ = [PlaynCorePlayN currentTime];
    id<PlaynCoreCanvasImage> image = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createImageWithFloat:40 withFloat:13];
    id<PlaynCoreCanvas> canvas = [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas];
    (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) setFillColorWithInt:[PlaynCoreColor rgbWithInt:50 withInt:50 withInt:50]];
    (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) drawTextWithNSString:[NSString stringWithFormat:@"%d FPS", frames_] withFloat:0 withFloat:[((id<PlaynCoreCanvasImage>) NIL_CHK(image)) height]];
    if (fpsLayer_ != nil) [((id<PlaynCoreGroupLayer>) [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) rootLayer]) removeWithPlaynCoreLayer:fpsLayer_];
    fpsLayer_ = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createImageLayerWithPlaynCoreImage:image];
    (void) [((id<PlaynCoreImageLayer>) NIL_CHK(fpsLayer_)) setDepthWithFloat:10000];
    [((id<PlaynCoreGroupLayer>) [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) rootLayer]) addWithPlaynCoreLayer:fpsLayer_];
    frames_ = 0;
  }
}

- (void)updateWithInt:(int)delta {
  delta = [JavaLangMath minWithInt:delta withInt:TuxkidsTuxblocksCoreTuxBlocksGame_MAX_DELTA];
  [((TuxkidsTuxblocksCoreSolidClock *) NIL_CHK(clock_)) updateWithInt:delta];
  [((TuxkidsTuxblocksCoreGameBackgroundSprite *) NIL_CHK(background_)) updateWithInt:delta];
  [((TripleplayGameScreenStack *) NIL_CHK(screens_)) updateWithInt:delta];
}

- (void)paintWithFloat:(float)alpha {
  [((TuxkidsTuxblocksCoreSolidClock *) NIL_CHK(clock_)) paintWithFloat:alpha];
  [((TuxkidsTuxblocksCoreGameBackgroundSprite *) NIL_CHK(background_)) paintWithPlaynCoreUtilClock:clock_];
  [((TripleplayGameScreenStack *) NIL_CHK(screens_)) paintWithPlaynCoreUtilClock:clock_];
  [self updateFPS];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreTuxBlocksGame *typedCopy = (TuxkidsTuxblocksCoreTuxBlocksGame *) copy;
  typedCopy.clock = clock_;
  typedCopy.screens = screens_;
  typedCopy.background = background_;
  typedCopy.frames = frames_;
  typedCopy.lastUpdate = lastUpdate_;
  typedCopy.fpsLayer = fpsLayer_;
}

@end
@implementation TuxkidsTuxblocksCoreTuxBlocksGame_$1

- (id<TripleplayGameScreenStack_Transition>)defaultPushTransition {
  return [self slide];
}

- (id<TripleplayGameScreenStack_Transition>)defaultPopTransition {
  return [[self slide] right];
}

- (id)init {
  return [super init];
}

@end