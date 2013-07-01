//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\projectile\ChainProjectile.java
//
//  Created by Thomas on 7/1/13.
//

#import "java/lang/Math.h"
#import "pythagoras/f/Vector.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/projectile/ChainProjectile.h"
#import "tuxkids/tuxblocks/core/defense/projectile/ConnectionProjectile.h"
#import "tuxkids/tuxblocks/core/defense/tower/Tower.h"
#import "tuxkids/tuxblocks/core/defense/walker/Walker.h"

@implementation TBChainProjectile

@synthesize hits = hits_;
@synthesize damageReduceFactor = damageReduceFactor_;
@synthesize rangeReduceFactor = rangeReduceFactor_;
@synthesize damageFactor = damageFactor_;
@synthesize rangeFactor = rangeFactor_;
- (TBChainProjectile *)parent {
  return parent_;
}
- (void)setParent:(TBChainProjectile *)parent {
  JreOperatorRetainedAssign(&parent_, self, parent);
}
@synthesize parent = parent_;
@synthesize hasChained = hasChained_;

- (float)range {
  return [((TBTower *) NIL_CHK(source__)) range] * rangeFactor_;
}

- (BOOL)partOfChainWithTBWalker:(TBWalker *)walker {
  if (target__ == walker) return YES;
  if (parent_ == nil) return NO;
  return [((TBChainProjectile *) NIL_CHK(parent_)) partOfChainWithTBWalker:walker];
}

- (PythagorasFVector *)sourcePosition {
  return parent_ == nil ? [((TBTower *) NIL_CHK(source__)) projectileStart] : [((TBWalker *) NIL_CHK(parent_.target_)) position];
}

- (TBChainProjectile *)createProjectile {
  return [self copy__WithInt:hits_ - 1 withFloat:damageReduceFactor_ withFloat:rangeReduceFactor_];
}

- (id)initWithInt:(int)hits
        withFloat:(float)damageReduceFactor
        withFloat:(float)rangeReduceFactor {
  if ((self = [super init])) {
    self.hits = hits;
    self.rangeFactor = 1;
    self.damageFactor = 1;
    self.damageReduceFactor = damageReduceFactor;
    self.rangeReduceFactor = rangeReduceFactor;
  }
  return self;
}

- (TBChainProjectile *)copy__WithInt:(int)hits
                           withFloat:(float)damageReduceFactor
                           withFloat:(float)rangeReduceFactor OBJC_METHOD_FAMILY_NONE {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (void)placeWithTBDGrid:(TBDGrid *)grid
            withTBWalker:(TBWalker *)target
   withTBChainProjectile:(TBChainProjectile *)parent {
  [super placeWithTBDGrid:grid withTBWalker:target withTBTower:((TBChainProjectile *) NIL_CHK(parent)).source_];
  self.parent = parent;
  self.damageFactor = ((TBChainProjectile *) NIL_CHK(parent)).damageFactor * damageReduceFactor_;
  self.rangeFactor = ((TBChainProjectile *) NIL_CHK(parent)).rangeFactor * rangeReduceFactor_;
  self.damage = [((TBTower *) NIL_CHK(source__)) damage] * damageFactor_;
  if ([JavaLangMath roundWithFloat:damage_ * damageFactor_] == 0) hits_ = 0;
  if (hits_ == 0) hasChained_ = YES;
}

- (BOOL)doUpdateWithInt:(int)delta {
  if (!hasChained_ && [self progress] > 0.4f) {
    BOOL fired = [((TBDGrid *) NIL_CHK(grid_)) fireProjectileWithTBChainProjectile:self];
    hasChained_ = fired;
  }
  return (BOOL) [super doUpdateWithInt:delta];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&parent_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBChainProjectile *typedCopy = (TBChainProjectile *) copy;
  typedCopy.hits = hits_;
  typedCopy.damageReduceFactor = damageReduceFactor_;
  typedCopy.rangeReduceFactor = rangeReduceFactor_;
  typedCopy.damageFactor = damageFactor_;
  typedCopy.rangeFactor = rangeFactor_;
  typedCopy.parent = parent_;
  typedCopy.hasChained = hasChained_;
}

@end
