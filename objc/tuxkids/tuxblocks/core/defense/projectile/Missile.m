//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\projectile\Missile.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Assets.h"
#import "playn/core/Image.h"
#import "pythagoras/f/Vector.h"
#import "tuxkids/tuxblocks/core/Constant.h"
#import "tuxkids/tuxblocks/core/PlayNObject.h"
#import "tuxkids/tuxblocks/core/defense/Grid.h"
#import "tuxkids/tuxblocks/core/defense/projectile/Missile.h"
#import "tuxkids/tuxblocks/core/effect/MissileExplosion.h"

@implementation TBMissile

- (float)maxSpeed {
  return 0.1f;
}

- (id<PlaynCoreImage>)createImage {
  return [((id<PlaynCoreAssets>) [TBPlayNObject assets]) getImageWithNSString:@"images/missile.png"];
}

- (float)acceleration {
  return 0.003f;
}

- (void)onFinish {
  [super onFinish];
  [[[TBMissileExplosion alloc] initWithTBDGrid:grid_ withPythagorasFVector:position_] autorelease];
}

- (id)init {
  return [super init];
}

- (void)dealloc {
  [super dealloc];
}

@end
