//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\tower\TowerType.java
//
//  Created by Thomas on 7/1/13.
//

@class TBTower;

#import "JreEmulation.h"
#import "java/lang/Enum.h"

typedef enum {
  TBTowerType_PeaShooter = 0,
  TBTowerType_Freezer = 1,
  TBTowerType_BigShooter = 2,
  TBTowerType_Zapper = 3,
  TBTowerType_VerticalWall = 4,
  TBTowerType_HorizontalWall = 5,
} TBTowerType;

@interface TBTowerTypeEnum : JavaLangEnum < NSCopying > {
 @public
  TBTower *instance__;
}
@property (nonatomic, retain) TBTower *instance_;

+ (TBTowerTypeEnum *)PeaShooter;
+ (TBTowerTypeEnum *)Freezer;
+ (TBTowerTypeEnum *)BigShooter;
+ (TBTowerTypeEnum *)Zapper;
+ (TBTowerTypeEnum *)VerticalWall;
+ (TBTowerTypeEnum *)HorizontalWall;
+ (IOSObjectArray *)values;
+ (TBTowerTypeEnum *)valueOfWithNSString:(NSString *)name;
- (id)copyWithZone:(NSZone *)zone;
- (TBTower *)instance;
- (TBTower *)newInstance OBJC_METHOD_FAMILY_NONE;
- (int)index;
- (id)initWithTBTower:(TBTower *)instance
         withNSString:(NSString *)name
              withInt:(int)ordinal;
@end
