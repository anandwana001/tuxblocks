//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\blocks\BaseBlock.java
//
//  Created by Thomas on 7/1/13.
//

@class PythagorasFPoint;
@class TBExpression;
@class TBModificationOperation;
@class TBModifierBlock;
@protocol JavaUtilList;
@protocol PlaynCoreGroupLayer;
@protocol PlaynCoreImageLayer;
@protocol PlaynCoreLayer;
@protocol PlaynCorePointer_Event;
@protocol TBBaseBlock_OnSimplifyListener;

#import "JreEmulation.h"
#import "playn/core/Layer.h"
#import "playn/core/Pointer.h"
#import "tuxkids/tuxblocks/core/solve/blocks/Block.h"

@interface TBBaseBlock : TBBlock {
 @public
  id<PlaynCoreGroupLayer> groupLayer_;
  id<JavaUtilList> modifiers_;
  TBExpression *baseExpression_;
  TBModifierBlock *previewBlock_;
  id<PlaynCoreImageLayer> simplifyCircle_;
  id<TBBaseBlock_OnSimplifyListener> simplifyListener_;
  PythagorasFPoint *nextBlockPos_;
}

@property (nonatomic, retain) id<PlaynCoreGroupLayer> groupLayer;
@property (nonatomic, retain) id<JavaUtilList> modifiers;
@property (nonatomic, retain) TBExpression *baseExpression;
@property (nonatomic, retain) TBModifierBlock *previewBlock;
@property (nonatomic, retain) id<PlaynCoreImageLayer> simplifyCircle;
@property (nonatomic, retain) id<TBBaseBlock_OnSimplifyListener> simplifyListener;
@property (nonatomic, retain) PythagorasFPoint *nextBlockPos;

- (BOOL)isShowingPreview;
- (void)setSimplifyListenerWithTBBaseBlock_OnSimplifyListener:(id<TBBaseBlock_OnSimplifyListener>)simplifyListener;
- (TBModifierBlock *)lastModifier;
- (TBExpression *)topLevelExpression;
- (BOOL)hasModifier;
- (float)groupWidth;
- (float)groupHeight;
- (id<PlaynCoreGroupLayer>)layer;
- (id)initWithTBExpression:(TBExpression *)baseExpression;
- (BOOL)canSimplify;
- (NSString *)getText;
- (void)destroy;
- (void)updateSimplify;
- (id<PlaynCoreImageLayer>)generateSpriteWithInt:(int)width
                                         withInt:(int)height
                                    withNSString:(NSString *)text
                                         withInt:(int)color;
- (void)addModifierWithTBModificationOperation:(TBModificationOperation *)mod;
- (void)addModifierWithTBModificationOperation:(TBModificationOperation *)mod
                                      withBOOL:(BOOL)isPreview;
- (TBModifierBlock *)pop;
- (PythagorasFPoint *)getNextBlockPosWithInt:(int)precidence;
- (void)updateShowPreviewWithFloat:(float)cx
                         withFloat:(float)cy
       withTBModificationOperation:(TBModificationOperation *)mod;
- (void)stopShowingPreview;
- (NSString *)description;
- (id)toMathString;
- (void)simplfyWithInt:(int)to;
@end

typedef TBBaseBlock TuxkidsTuxblocksCoreSolveBlocksBaseBlock;

@protocol TBBaseBlock_OnSimplifyListener < NSObject >
- (void)onSimplifyWithTBBaseBlock:(TBBaseBlock *)baseBlock
                     withNSString:(NSString *)expression
                          withInt:(int)answer
                          withInt:(int)start;
@end

@interface TBBaseBlock_SimplifyListener : NSObject < PlaynCorePointer_Listener > {
 @public
  TBBaseBlock *this$0_;
}

@property (nonatomic, retain) TBBaseBlock *this$0;

- (void)onPointerStartWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (void)onPointerEndWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (void)onPointerDragWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (void)onPointerCancelWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event;
- (id)initWithTBBaseBlock:(TBBaseBlock *)outer$;
@end

@interface TBBaseBlock_$1 : NSObject < PlaynCoreLayer_HitTester > {
}

- (id<PlaynCoreLayer>)hitTestWithPlaynCoreLayer:(id<PlaynCoreLayer>)layer
                           withPythagorasFPoint:(PythagorasFPoint *)p;
- (id)init;
@end
