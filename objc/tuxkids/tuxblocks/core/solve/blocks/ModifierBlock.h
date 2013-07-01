//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\blocks\ModifierBlock.java
//
//  Created by Thomas on 7/1/13.
//

@class TBModificationOperation;
@protocol PlaynCoreImageLayer;

#import "JreEmulation.h"
#import "tuxkids/tuxblocks/core/solve/blocks/Block.h"

@interface TBModifierBlock : TBBlock {
 @public
  TBModificationOperation *modifier_, *inverseModifier_;
  BOOL isInverted__;
  id<PlaynCoreImageLayer> inverseSprite_;
}

@property (nonatomic, retain) TBModificationOperation *modifier;
@property (nonatomic, retain) TBModificationOperation *inverseModifier;
@property (nonatomic, assign) BOOL isInverted_;
@property (nonatomic, retain) id<PlaynCoreImageLayer> inverseSprite;

- (TBModificationOperation *)getModifier;
- (TBModificationOperation *)getOriginalModifier;
- (id<PlaynCoreImageLayer>)layer;
- (BOOL)isInverted;
- (void)setInvertedWithBOOL:(BOOL)inverted;
- (id)initWithTBModificationOperation:(TBModificationOperation *)op
                              withInt:(int)width
                              withInt:(int)height;
- (void)invert;
- (NSString *)description;
- (int)getColor;
@end

typedef TBModifierBlock TuxkidsTuxblocksCoreSolveBlocksModifierBlock;
