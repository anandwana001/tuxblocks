//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\walker\PhaseWalker.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Math.h"
#import "tuxkids/tuxblocks/core/ImageLayerTintable.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/walker/PhaseWalker.h"
#import "tuxkids/tuxblocks/core/defense/walker/Walker.h"

@implementation TBPhaseWalker

- (id)initWithInt:(int)maxHp
          withInt:(int)walkCellTime {
  return [super initWithInt:maxHp withInt:walkCellTime];
}

- (void)updateMovementWithFloat:(float)perc {
  alpha_ = [JavaLangMath minWithFloat:2 - perc * 2 withFloat:1];
  [((TBImageLayerTintable *) NIL_CHK(layer__)) setTranslationWithFloat:((PythagorasIPoint *) NIL_CHK(lastCoordinates_)).y_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize] withFloat:((PythagorasIPoint *) NIL_CHK(lastCoordinates_)).x_ * [((TBDGrid *) NIL_CHK(grid_)) cellSize]];
}

- (TBWalker *)copy__ OBJC_METHOD_FAMILY_NONE {
  return [[[TBPhaseWalker alloc] initWithInt:maxHp_ withInt:walkCellTime__] autorelease];
}

- (void)dealloc {
  [super dealloc];
}

@end
