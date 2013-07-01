//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\tower\Freezer.java
//
//  Created by Thomas on 7/1/13.
//

@class TBProjectile;
@class TBWalker;

#import "JreEmulation.h"
#import "tuxkids/tuxblocks/core/defense/tower/Tower.h"

@interface TBFreezer : TBTower {
}

- (int)rows;
- (int)cols;
- (float)damage;
- (int)fireRate;
- (float)range;
- (TBProjectile *)createProjectile;
- (TBTower *)copy__ OBJC_METHOD_FAMILY_NONE;
- (NSString *)name;
- (int)cost;
- (int)commonness;
- (float)splashRadius;
- (void)addBuffsWithTBWalker:(TBWalker *)walker;
- (id)init;
@end

typedef TBFreezer TuxkidsTuxblocksCoreDefenseTowerFreezer;
