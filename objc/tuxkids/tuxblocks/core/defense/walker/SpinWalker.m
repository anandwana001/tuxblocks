//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\walker\SpinWalker.java
//
//  Created by Thomas on 7/1/13.
//

#import "pythagoras/f/FloatMath.h"
#import "tuxkids/tuxblocks/core/ImageLayerTintable.h"
#import "tuxkids/tuxblocks/core/PlayNObject.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/walker/SpinWalker.h"
#import "tuxkids/tuxblocks/core/defense/walker/Walker.h"

@implementation TBSpinWalker

- (id)initWithInt:(int)maxHp
          withInt:(int)walkCellTime {
  return [super initWithInt:maxHp withInt:walkCellTime];
}

- (void)updateMovementWithFloat:(float)perc {
  float x = [TBPlayNObject lerpWithFloat:((PythagorasIPoint *) NIL_CHK(lastCoordinates_)).y_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize] withFloat:((PythagorasIPoint *) NIL_CHK(coordinates__)).y_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize] withFloat:perc];
  float y = [TBPlayNObject lerpWithFloat:((PythagorasIPoint *) NIL_CHK(lastCoordinates_)).x_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize] withFloat:((PythagorasIPoint *) NIL_CHK(coordinates__)).x_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize] withFloat:perc];
  [((TBImageLayerTintable *) NIL_CHK(layer__)) setOriginWithFloat:[((TBImageLayerTintable *) NIL_CHK(layer__)) width] / 2 withFloat:[((TBImageLayerTintable *) NIL_CHK(layer__)) height] / 2];
  [((TBImageLayerTintable *) NIL_CHK(layer__)) setTranslationWithFloat:x + [((TBImageLayerTintable *) NIL_CHK(layer__)) originX] withFloat:y + [((TBImageLayerTintable *) NIL_CHK(layer__)) originY]];
  [((TBImageLayerTintable *) NIL_CHK(layer__)) setRotationWithFloat:perc * PythagorasFFloatMath_PI];
}

- (TBWalker *)copy__ OBJC_METHOD_FAMILY_NONE {
  return [[[TBSpinWalker alloc] initWithInt:maxHp_ withInt:walkCellTime__] autorelease];
}

- (void)dealloc {
  [super dealloc];
}

@end
