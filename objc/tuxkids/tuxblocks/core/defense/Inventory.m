//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\Inventory.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSIntArray.h"
#import "IOSObjectArray.h"
#import "java/lang/Math.h"
#import "playn/core/Canvas.h"
#import "playn/core/CanvasImage.h"
#import "playn/core/Color.h"
#import "playn/core/Font.h"
#import "playn/core/Graphics.h"
#import "playn/core/GroupLayer.h"
#import "playn/core/Image.h"
#import "playn/core/ImageLayer.h"
#import "playn/core/Layer.h"
#import "playn/core/Pointer.h"
#import "playn/core/TextFormat.h"
#import "playn/core/TextLayout.h"
#import "tripleplay/util/Colors.h"
#import "tuxkids/tuxblocks/core/Button.h"
#import "tuxkids/tuxblocks/core/Constant.h"
#import "tuxkids/tuxblocks/core/GameState.h"
#import "tuxkids/tuxblocks/core/ImageLayerTintable.h"
#import "tuxkids/tuxblocks/core/MenuSprite.h"
#import "tuxkids/tuxblocks/core/PlayNObject.h"
#import "tuxkids/tuxblocks/core/defense/DefenseScreen.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/Inventory.h"
#import "tuxkids/tuxblocks/core/defense/tower/Tower.h"
#import "tuxkids/tuxblocks/core/defense/tower/TowerType.h"
#import "tuxkids/tuxblocks/core/utils/CanvasUtils.h"

@implementation TBDInventory

- (TBDGrid *)grid {
  return grid_;
}
- (void)setGrid:(TBDGrid *)grid {
  JreOperatorRetainedAssign(&grid_, self, grid);
}
@synthesize grid = grid_;
- (id<PlaynCoreGroupLayer>)groupLayer {
  return groupLayer_;
}
- (void)setGroupLayer:(id<PlaynCoreGroupLayer>)groupLayer {
  JreOperatorRetainedAssign(&groupLayer_, self, groupLayer);
}
@synthesize groupLayer = groupLayer_;
@synthesize width = width_;
@synthesize height = height_;
- (IOSObjectArray *)countSprites {
  return countSprites_;
}
- (void)setCountSprites:(IOSObjectArray *)countSprites {
  JreOperatorRetainedAssign(&countSprites_, self, countSprites);
}
@synthesize countSprites = countSprites_;
- (IOSObjectArray *)itemButtons {
  return itemButtons_;
}
- (void)setItemButtons:(IOSObjectArray *)itemButtons {
  JreOperatorRetainedAssign(&itemButtons_, self, itemButtons);
}
@synthesize itemButtons = itemButtons_;
- (PlaynCoreTextFormat *)textFormat {
  return textFormat_;
}
- (void)setTextFormat:(PlaynCoreTextFormat *)textFormat {
  JreOperatorRetainedAssign(&textFormat_, self, textFormat);
}
@synthesize textFormat = textFormat_;
- (TBDDefenseScreen *)screen {
  return screen_;
}
- (void)setScreen:(TBDDefenseScreen *)screen {
  JreOperatorRetainedAssign(&screen_, self, screen);
}
@synthesize screen = screen_;

- (id<PlaynCoreGroupLayer>)layer {
  return groupLayer_;
}

- (int)getItemSpriteSize {
  int wSize = (int) ((width_ - TBDInventory_ITEM_SPRITE_MARGIN * 2) / TBDInventory_COLS * 0.9f);
  int hSize = (int) ((height_ - TBDInventory_ITEM_SPRITE_MARGIN * 2) / [self rows] * 0.9f) - [self getItemCaptionHeight];
  return [JavaLangMath minWithInt:wSize withInt:hSize];
}

- (int)getItemCaptionHeight {
  return textFormat_ == nil ? 0 : (int) ([((id<PlaynCoreFont>) NIL_CHK(textFormat_.font)) size] + TBDInventory_ITEM_SPRITE_MARGIN);
}

- (float)getItemSpriteXWithInt:(int)index {
  int j = index % TBDInventory_COLS;
  float spriteWidth = width_ / TBDInventory_COLS;
  return width_ / 2 + (j - (TBDInventory_COLS - 1) * 0.5f) * spriteWidth;
}

- (int)rows {
  return ([TBTower towerCount] - 1) / TBDInventory_COLS + 1;
}

- (float)getItemSpriteYWithInt:(int)index {
  int i = index / TBDInventory_COLS;
  int rows = [self rows];
  float spriteHeight = [self getItemSpriteSize] + TBDInventory_ITEM_SPRITE_MARGIN * 2 + [self getItemCaptionHeight];
  return height_ / 2 + (i - (rows - 1) * 0.5f) * spriteHeight;
}

- (IOSIntArray *)towerCounts {
  return [[((TBDDefenseScreen *) NIL_CHK(screen_)) state] towerCounts];
}

- (id)initWithTBDDefenseScreen:(TBDDefenseScreen *)screen
                   withTBDGrid:(TBDGrid *)grid
                       withInt:(int)width
                       withInt:(int)height {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&groupLayer_, self, [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createGroupLayer]);
    self.screen = screen;
    self.grid = grid;
    self.width = width;
    self.height = height;
    JreOperatorRetainedAssign(&textFormat_, self, [((PlaynCoreTextFormat *) [[[PlaynCoreTextFormat alloc] init] autorelease]) withFontWithPlaynCoreFont:[((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createFontWithNSString:[TBConstant FONT_NAME] withPlaynCoreFont_StyleEnum:[PlaynCoreFont_StyleEnum BOLD] withFloat:[self getItemSpriteSize] / 7]]);
    [self createSelectionSprites];
    [self createCountSprites];
    [[((TBDDefenseScreen *) NIL_CHK(screen)) state] setInventoryChangedListenerWithTBGameState_InventoryChangedListener:[[[TBDInventory_$1 alloc] initWithTBDInventory:self] autorelease]];
  }
  return self;
}

- (void)createCountSprites {
  JreOperatorRetainedAssign(&countSprites_, self, [[[IOSObjectArray alloc] initWithLength:(int) [[self towerCounts] count] type:[IOSClass classWithProtocol:@protocol(PlaynCoreImageLayer)]] autorelease]);
  for (int i = 0; i < (int) [((IOSObjectArray *) NIL_CHK(countSprites_)) count]; i++) {
    [((IOSObjectArray *) NIL_CHK(countSprites_)) replaceObjectAtIndex:i withObject:[((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createImageLayer]];
    (void) [((id<PlaynCoreImageLayer>) [((IOSObjectArray *) NIL_CHK(countSprites_)) objectAtIndex:i]) setTranslationWithFloat:[self getItemSpriteXWithInt:i] - [self getItemSpriteSize] / 2 + TBDInventory_ITEM_SPRITE_MARGIN withFloat:[self getItemSpriteYWithInt:i] - [self getItemSpriteSize] / 2 - [self getItemCaptionHeight] / 2 + TBDInventory_ITEM_SPRITE_MARGIN];
    [((id<PlaynCoreGroupLayer>) NIL_CHK(groupLayer_)) addWithPlaynCoreLayer:((id<PlaynCoreImageLayer>) [((IOSObjectArray *) NIL_CHK(countSprites_)) objectAtIndex:i])];
    [self refreshCountSpriteWithInt:i];
  }
}

- (void)refreshCountSprites {
  for (int i = 0; i < (int) [((IOSObjectArray *) NIL_CHK(countSprites_)) count]; i++) {
    [self refreshCountSpriteWithInt:i];
  }
}

- (void)refreshCountSpriteWithInt:(int)index {
  NSString *text = [NSString stringWithFormat:@"x%d", [[self towerCounts] intAtIndex:index]];
  id<PlaynCoreTextLayout> layout = [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) layoutTextWithNSString:text withPlaynCoreTextFormat:textFormat_];
  id<PlaynCoreCanvasImage> image = [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createImageWithFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout)) width] withFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout)) height]];
  (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) setFillColorWithInt:[TripleplayUtilColors BLACK]];
  (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) fillTextWithPlaynCoreTextLayout:layout withFloat:0 withFloat:0];
  (void) [((id<PlaynCoreImageLayer>) [((IOSObjectArray *) NIL_CHK(countSprites_)) objectAtIndex:index]) setImageWithPlaynCoreImage:image];
  [((TBButton *) [((IOSObjectArray *) NIL_CHK(itemButtons_)) objectAtIndex:index]) setEnabledWithBOOL:[[self towerCounts] intAtIndex:index] > 0];
}

- (void)createSelectionSprites {
  int spriteSize = [self getItemSpriteSize];
  int textHeight = [self getItemCaptionHeight];
  int rad = (int) (spriteSize * 0.05f);
  float padding = spriteSize * 0.1f;
  float cellSize = (spriteSize - padding * 2) / 3;
  float strokeWidth = 5;
  JreOperatorRetainedAssign(&itemButtons_, self, [[[IOSObjectArray alloc] initWithLength:[TBTower towerCount] type:[IOSClass classWithClass:[TBButton class]]] autorelease]);
  for (int index = 0; index < (int) [((IOSObjectArray *) NIL_CHK(itemButtons_)) count]; index++) {
    TBTowerTypeEnum *towerType = [TBTower getTypeByIndexWithInt:index];
    id<PlaynCoreTextLayout> layout = [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) layoutTextWithNSString:[[((TBTowerTypeEnum *) NIL_CHK(towerType)) instance] name] withPlaynCoreTextFormat:textFormat_];
    float indentX = [JavaLangMath maxWithFloat:0 withFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout)) width] - spriteSize] / 2;
    id<PlaynCoreCanvasImage> image = [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createImageWithFloat:[JavaLangMath maxWithFloat:spriteSize withFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout)) width]] withFloat:spriteSize + textHeight];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) setFillColorWithInt:[TripleplayUtilColors WHITE]];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) fillRoundRectWithFloat:indentX withFloat:0 withFloat:spriteSize withFloat:spriteSize withFloat:rad];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) setStrokeColorWithInt:[TripleplayUtilColors DARK_GRAY]];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) setStrokeWidthWithFloat:strokeWidth];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) strokeRoundRectWithFloat:indentX + strokeWidth / 2 - 1 withFloat:strokeWidth / 2 - 1 withFloat:spriteSize - strokeWidth + 2 withFloat:spriteSize - strokeWidth + 2 withFloat:rad];
    id<PlaynCoreImage> towerImage = [[((TBTowerTypeEnum *) NIL_CHK(towerType)) instance] createImageWithFloat:cellSize withInt:[((TBDGrid *) NIL_CHK(grid_)) towerColor]];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) drawImageWithPlaynCoreImage:towerImage withFloat:indentX + (spriteSize - [((id<PlaynCoreImage>) NIL_CHK(towerImage)) width]) / 2 withFloat:(spriteSize - [((id<PlaynCoreImage>) NIL_CHK(towerImage)) height]) / 2];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) setFillColorWithInt:[TripleplayUtilColors WHITE]];
    (void) [((id<PlaynCoreCanvas>) [((id<PlaynCoreCanvasImage>) NIL_CHK(image)) canvas]) fillTextWithPlaynCoreTextLayout:layout withFloat:([((id<PlaynCoreCanvasImage>) NIL_CHK(image)) width] - [((id<PlaynCoreTextLayout>) NIL_CHK(layout)) width]) / 2 withFloat:[((id<PlaynCoreCanvasImage>) NIL_CHK(image)) height] - textHeight + TBDInventory_ITEM_SPRITE_MARGIN / 2];
    TBButton *button = [[[TBButton alloc] initWithPlaynCoreImage:image withBOOL:NO] autorelease];
    float x = [self getItemSpriteXWithInt:index];
    float y = [self getItemSpriteYWithInt:index];
    [((TBButton *) NIL_CHK(button)) setPositionWithFloat:x withFloat:y];
    [((TBButton *) NIL_CHK(button)) setTintWithInt:[TripleplayUtilColors WHITE] withInt:[PlaynCoreColor rgbWithInt:230 withInt:230 withInt:230]];
    int fi = index;
    [[((TBButton *) NIL_CHK(button)) imageLayer] addListenerWithPlaynCorePointer_Listener:[[[TBDInventory_$2 alloc] initWithTBDInventory:self withTBButton:button withTBTowerTypeEnum:towerType withInt:fi] autorelease]];
    [((id<PlaynCoreGroupLayer>) NIL_CHK(groupLayer_)) addWithPlaynCoreLayer:[((TBButton *) NIL_CHK(button)) layerAddable]];
    [((IOSObjectArray *) NIL_CHK(itemButtons_)) replaceObjectAtIndex:index withObject:button];
  }
}

- (void)createBackgroundSprite {
  id<PlaynCoreImage> image = [TBCanvasUtils createRectWithFloat:width_ withFloat:height_ withInt:[PlaynCoreColor rgbWithInt:200 withInt:125 withInt:125] withFloat:1 withInt:[TripleplayUtilColors DARK_GRAY]];
  id<PlaynCoreImageLayer> layer = [((id<PlaynCoreGraphics>) [TBPlayNObject graphics]) createImageLayerWithPlaynCoreImage:image];
  (void) [((id<PlaynCoreImageLayer>) NIL_CHK(layer)) setAlphaWithFloat:[TBMenuSprite DEFAULT_ALPHA]];
  [((id<PlaynCoreGroupLayer>) NIL_CHK(groupLayer_)) addWithPlaynCoreLayer:layer];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&screen_, self, nil);
  JreOperatorRetainedAssign(&textFormat_, self, nil);
  JreOperatorRetainedAssign(&itemButtons_, self, nil);
  JreOperatorRetainedAssign(&countSprites_, self, nil);
  JreOperatorRetainedAssign(&groupLayer_, self, nil);
  JreOperatorRetainedAssign(&grid_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBDInventory *typedCopy = (TBDInventory *) copy;
  typedCopy.grid = grid_;
  typedCopy.groupLayer = groupLayer_;
  typedCopy.width = width_;
  typedCopy.height = height_;
  typedCopy.countSprites = countSprites_;
  typedCopy.itemButtons = itemButtons_;
  typedCopy.textFormat = textFormat_;
  typedCopy.screen = screen_;
}

@end
@implementation TBDInventory_$1

- (TBDInventory *)this$0 {
  return this$0_;
}
- (void)setThis$0:(TBDInventory *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;

- (void)onInventoryChangedWithInt:(int)index
                          withInt:(int)count {
  [this$0_ refreshCountSpriteWithInt:index];
}

- (id)initWithTBDInventory:(TBDInventory *)outer$ {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBDInventory_$1 *typedCopy = (TBDInventory_$1 *) copy;
  typedCopy.this$0 = this$0_;
}

@end
@implementation TBDInventory_$2

- (TBDInventory *)this$0 {
  return this$0_;
}
- (void)setThis$0:(TBDInventory *)this$0 {
  JreOperatorRetainedAssign(&this$0_, self, this$0);
}
@synthesize this$0 = this$0_;
- (TBButton *)val$button {
  return val$button_;
}
- (void)setVal$button:(TBButton *)val$button {
  JreOperatorRetainedAssign(&val$button_, self, val$button);
}
@synthesize val$button = val$button_;
- (TBTowerTypeEnum *)val$towerType {
  return val$towerType_;
}
- (void)setVal$towerType:(TBTowerTypeEnum *)val$towerType {
  JreOperatorRetainedAssign(&val$towerType_, self, val$towerType);
}
@synthesize val$towerType = val$towerType_;
@synthesize val$fi = val$fi_;

- (void)onPointerStartWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event {
  if (![((TBButton *) NIL_CHK(val$button_)) enabled]) return;
  [((TBDGrid *) NIL_CHK(this$0_.grid)) startPlacementWithTBTower:[((TBTowerTypeEnum *) NIL_CHK(val$towerType_)) newInstance]];
}

- (void)onPointerEndWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event {
  if (![((TBButton *) NIL_CHK(val$button_)) enabled]) return;
  if ([((TBDGrid *) NIL_CHK(this$0_.grid)) endPlacementWithFloat:[((id<PlaynCorePointer_Event>) NIL_CHK(event)) x] withFloat:[((id<PlaynCorePointer_Event>) NIL_CHK(event)) y]]) {
    [[this$0_ towerCounts] postDecr:val$fi_];
    [this$0_ refreshCountSpriteWithInt:val$fi_];
  }
}

- (void)onPointerDragWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event {
  if (![((TBButton *) NIL_CHK(val$button_)) enabled]) return;
  [((TBDGrid *) NIL_CHK(this$0_.grid)) updatePlacementWithFloat:[((id<PlaynCorePointer_Event>) NIL_CHK(event)) x] withFloat:[((id<PlaynCorePointer_Event>) NIL_CHK(event)) y]];
}

- (void)onPointerCancelWithPlaynCorePointer_Event:(id<PlaynCorePointer_Event>)event {
}

- (id)initWithTBDInventory:(TBDInventory *)outer$
              withTBButton:(TBButton *)capture$0
       withTBTowerTypeEnum:(TBTowerTypeEnum *)capture$1
                   withInt:(int)capture$2 {
  if ((self = [super init])) {
    JreOperatorRetainedAssign(&this$0_, self, outer$);
    JreOperatorRetainedAssign(&val$button_, self, capture$0);
    JreOperatorRetainedAssign(&val$towerType_, self, capture$1);
    val$fi_ = capture$2;
  }
  return self;
}

- (void)dealloc {
  JreOperatorRetainedAssign(&val$towerType_, self, nil);
  JreOperatorRetainedAssign(&val$button_, self, nil);
  JreOperatorRetainedAssign(&this$0_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBDInventory_$2 *typedCopy = (TBDInventory_$2 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.val$button = val$button_;
  typedCopy.val$towerType = val$towerType_;
  typedCopy.val$fi = val$fi_;
}

@end
