//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\defense\select\Problem.java
//
//  Created by Thomas on 7/1/13.
//

@class TBEquation;
@class TBReward;
@class TBTowerTypeEnum;

#import "JreEmulation.h"

@interface TBProblem : NSObject {
 @public
  TBEquation *equation__;
  TBReward *reward__;
}

@property (nonatomic, retain) TBEquation *equation_;
@property (nonatomic, retain) TBReward *reward_;

- (TBEquation *)equation;
- (TBReward *)reward;
- (void)setEquationWithTBEquation:(TBEquation *)equation;
- (id)initWithTBEquation:(TBEquation *)equation
     withTBTowerTypeEnum:(TBTowerTypeEnum *)reward
                 withInt:(int)rewardCount;
- (id)initWithTBEquation:(TBEquation *)equation
            withTBReward:(TBReward *)reward;
@end

typedef TBProblem TuxkidsTuxblocksCoreDefenseSelectProblem;
