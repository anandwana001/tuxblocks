//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\round\Round.java
//
//  Created by Thomas on 7/1/13.
//

@class TBGameState;
@class TBReward;
@class TBWalker;
@class TBWave;
@protocol JavaUtilList;

#import "JreEmulation.h"

@interface TBRound : NSObject {
 @public
  id<JavaUtilList> waves_;
  id<JavaUtilList> waitTimes_;
  int timer_;
  TBWave *currentWave_;
  int nextDepth__;
  id<JavaUtilList> rewards_;
}

@property (nonatomic, retain) id<JavaUtilList> waves;
@property (nonatomic, retain) id<JavaUtilList> waitTimes;
@property (nonatomic, assign) int timer;
@property (nonatomic, retain) TBWave *currentWave;
@property (nonatomic, assign) int nextDepth_;
@property (nonatomic, retain) id<JavaUtilList> rewards;

- (void)populateRound;
- (float)nextDepth;
- (id)init;
- (void)addWaveWithTBWave:(TBWave *)wave
                  withInt:(int)waitTime;
- (void)addRewardWithTBReward:(TBReward *)reward;
- (void)winRoundWithTBGameState:(TBGameState *)gameState;
- (TBWalker *)updateWithInt:(int)delta;
- (BOOL)finished;
@end

typedef TBRound TuxkidsTuxblocksCoreDefenseRoundRound;
