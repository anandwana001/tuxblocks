//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\blocks\Block.java
//
//  Created by Thomas on 7/1/13.
//

@class PlaynCoreTextFormat;
@class TBBaseBlock;
@class TBExpression;
@protocol PlaynCoreImageLayer;
@protocol PlaynCoreLayer;

#import "JreEmulation.h"
#import "tuxkids/tuxblocks/core/PlayNObject.h"

#define TBBlock_BASE_SIZE 150
#define TBBlock_MOD_SIZE 50

@interface TBBlock : TBPlayNObject {
 @public
  id<PlaynCoreImageLayer> layer__;
}

@property (nonatomic, retain) id<PlaynCoreImageLayer> layer_;

+ (int)BASE_SIZE;
+ (int)MOD_SIZE;
+ (PlaynCoreTextFormat *)textFormat;
+ (void)setTextFormat:(PlaynCoreTextFormat *)textFormat;
- (float)width;
- (float)height;
- (id<PlaynCoreLayer>)layer;
- (int)getColor;
+ (TBBaseBlock *)createBlockWithTBExpression:(TBExpression *)exp;
- (id<PlaynCoreImageLayer>)generateSpriteWithInt:(int)width
                                         withInt:(int)height
                                    withNSString:(NSString *)text
                                         withInt:(int)color;
- (void)destroy;
- (id)init;
@end

typedef TBBlock TuxkidsTuxblocksCoreSolveBlocksBlock;
